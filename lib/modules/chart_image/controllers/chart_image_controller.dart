import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:astro_chat_ai/headers.dart';
import 'package:astro_chat_ai/models/text_completion_model.dart';
import 'package:astro_chat_ai/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ChartImageController extends GetxController {
  bool? isLoading;

  ui.Image? chartImage;

  String v3url = "https://api.vedicastroapi.com/v3-json/";

  // String apikey = "9bb970b8-2d1b-5f49-ae45-381f98aaa062";
  String apikey = "cc81ab43-899d-5823-a72c-c1f62970352a";

  List<TextCompletionData> messages = [];

  var state = ApiState.notFound.obs;
  TextEditingController searchTextController = TextEditingController();

  bool alreadyAppended = false;
  RxBool isKeyboardVisible = false.obs;
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void onInit() {
    super.onInit();
    loadChartImageBasedOnData(Get.arguments['UserData']);

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        isKeyboardVisible.value = visible;
        update(['ChartImage']);
      }
    });
  }

  @override
  void onClose() {
    keyboardSubscription.cancel();
    super.onClose();
    alreadyAppended = false;
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
    alreadyAppended = false;
  }

  void getTextCompletion(String query, UserData userData) async {
    addMyMessage();

    state.value = ApiState.loading;

    String _appendData = '';
    if (!alreadyAppended) {
      _appendData = await _getQuery(userData);
    }

    if (_appendData.isNotEmpty) {
      // API Call
      _appendData = '$_appendData\n $query';
      query = _appendData;
    }

    try {
      print('API query $query');
      Map<String, dynamic> rowParams = {
        "model": "text-davinci-001",
        "prompt":
        // "Date of birth is ${DateFormat("dd/MM/yyyy").format(userData.dob!)}, "
        //     "Time of birth is ${userData.timeOfBirth!.hour.toString().padLeft(2, '0')}:${userData.timeOfBirth!.minute.toString().padLeft(2, '0')}"
            // "${userData.placeOfBirth != null ? "and place of birth: ${userData.placeOfBirth}" : ""}"
            "Astrological question: $query",
        "max_tokens": 500,
        "temperature": 0.5,
      };

      final encodedParams = json.encode(rowParams);

      final response = await http.post(
        Uri.parse(endPoint("completions")),
        body: encodedParams,
        headers: headerBearerOption(OPEN_AI_KEY),
      );
      print("Response  body     ${response.body}");
      if (response.statusCode == 200) {
        // messages =
        //     TextCompletionModel.fromJson(json.decode(response.body)).choices;
        //
        addServerMessage(
            TextCompletionModel.fromJson(json.decode(response.body)).choices);
        state.value = ApiState.success;
      } else {
        // throw ServerException(message: "Image Generation Server Exception");
        state.value = ApiState.error;
      }
    } catch (e) {
      print("Errorrrrrrrrrrrrrrr  ");
    } finally {
      // searchTextController.clear();
      clearTextField();
      update();
    }
  }

  addServerMessage(List<TextCompletionData> choices) {
    for (int i = 0; i < choices.length; i++) {
      messages.insert(i, choices[i]);
    }
  }

  addMyMessage() {
    // {"text":":\n\nWell, there are a few things that you can do to increase","index":0,"logprobs":null,"finish_reason":"length"}
    TextCompletionData text = TextCompletionData(
        text: searchTextController.text, index: -999999, finish_reason: "");
    messages.insert(0, text);
  }

  clearTextField() {
    searchTextController.clear();
  }

  Future<void> loadChartImageBasedOnData(UserData userData) async {
    isLoading = true;
    String getChartImageUrl =
        "${v3url}horoscope/chart-image?dob=${DateFormat("dd/MM/yyyy").format(userData.dob!)}&tob=${userData.timeOfBirth!.hour.toString().padLeft(2, '0')}:${userData.timeOfBirth!.minute.toString().padLeft(2, '0')}&lat=${userData.birthplaceLat}&lon=${userData.birthplaceLong}&tz=5.5&div=D1&color=%2523ff3366&style=north&api_key=$apikey&lang=en&size=300";
    final http.Response result = await http.get(Uri.parse(getChartImageUrl));
    String svgString = result.body;
    final PictureInfo pictureInfo =
        // ignore: use_build_context_synchronously
        await vg.loadPicture(SvgStringLoader(svgString), Get.context);
    final ui.Image image = await pictureInfo.picture.toImage(300, 300);
    chartImage = image;
    isLoading = false;
    update(["ChartImage"]);
  }

  Future<String> _getQuery(UserData userData) async {
    String _data = '';

    try {

      String getChartImageUrl =
          "${v3url}horoscope/planet-details";
      final http.Response result = await http.get(Uri.parse(getChartImageUrl),

        headers: {
          "dob": DateFormat("dd/MM/yyyy").format(userData.dob!),
          "tob": "${userData.timeOfBirth!.hour.toString().padLeft(2, '0')}:${userData.timeOfBirth!.minute.toString().padLeft(2, '0')}",
          "lon": "${userData.birthplaceLong}",
          "lat": "${userData.birthplaceLat}",
          "tz": "5.5",
          "lang": "en",
          "api_key": apikey
        }
      );
      String responseString = result.body;

      final Map<String, dynamic> map = json.decode(responseString);
      Map<String, dynamic> response = map['response'];
      Map<String, String> _nakshtra = {};
      Map<String, String> _houses = {};
      List<String> mElements = response.keys.where((element)=> int.tryParse(element)!= null).toList();
      for (String loc in mElements) {
        if (response.containsKey(loc)) {
          String nakshtraName = response[loc]['full_name'];
          if (!_nakshtra.containsKey(nakshtraName)) {
            _nakshtra[nakshtraName] =
                '${nakshtraName} is at ${response[loc]['local_degree'].toStringAsFixed(4)} degree at ${response[loc]['nakshatra']} nakshtra.';
          }
        }
      }

      for (String loc in mElements) {
        int houseNo = response[loc]['house'];
        if (!_houses.containsKey(houseNo.toString())) {
          String planets = getPlanets(response, houseNo);
          _nakshtra[houseNo.toString()] =
          '${getPrefixOfHouse(houseNo)} house is ${response[loc]['zodiac']}. ${getPrefixOfHouse(houseNo)} house has $planets planets.';
        }
      }
      print('_nakshtra planets ${(_nakshtra.values.toList()).join('\n')}');

      _data = _nakshtra.values.toList().join('\n');
      alreadyAppended = true;
    } catch (e) {
      print(e);
      _data = '';
      rethrow;
    }
    return _data;
  }

  String getPlanets(Map<String, dynamic> response, int houseNo) {

    List<String> planets = [];
    List<String> mElements = response.keys.where((element)=> int.tryParse(element)!= null).toList();
    List data = response.entries.map((e) {
      if (mElements.contains(e.key)) {
        return e.value;
      }
      return null;
    }).whereType<Map>().where((element) => element['house'] == houseNo).toList();

    for (var _data in data) {
      String pData = _data['full_name'];
      if (!planets.contains(pData)) {
        planets.add(pData);
      }
    }

    if (planets.isEmpty) {
      return 'no';
    }
    return planets.join(', ');
  }

  String getPrefixOfHouse(int house) {
    if (house == 1) {
      return '${house}st';
    }
    if (house == 2) {
      return '${house}nd';
    }
    if (house == 3) {
      return '${house}rd';
    }
    return '${house}th';
  }

  void toggle() {
    isKeyboardVisible.value = !isKeyboardVisible.value;
    update(['ChartImage']);
  }
}
