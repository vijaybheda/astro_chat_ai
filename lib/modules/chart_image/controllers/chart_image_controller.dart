import 'dart:ui' as ui;

import 'package:astro_chat_ai/models/user_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ChartImageController extends GetxController {
  bool? isLoading;

  ui.Image? chartImage;

  String v3url = "https://api.vedicastroapi.com/v3-json/";

  String apikey = "9bb970b8-2d1b-5f49-ae45-381f98aaa062";

  @override
  void onInit() {
    super.onInit();
    loadChartImageBasedOnData(Get.arguments['UserData']);
  }

  Future<void> loadChartImageBasedOnData(UserData userData) async {
    isLoading = true;
    String getChartImageUrl =
        "${v3url}horoscope/chart-image?dob=${DateFormat("dd/MM/yyyy").format(userData.dob!)}&tob=${userData.timeOfBirth!.hour.toString().padLeft(2, '0')}:${userData.timeOfBirth!.minute.toString().padLeft(2, '0')}&lat=11&lon=77&tz=5.5&div=D1&color=%2523ff3366&style=north&api_key=${apikey}&lang=en&size=300";
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
}
