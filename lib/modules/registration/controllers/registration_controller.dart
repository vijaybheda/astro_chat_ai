import 'package:astro_chat_ai/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController timeOfBirthController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController latController = TextEditingController(text: '21.2300');
  TextEditingController longController = TextEditingController(text: '72.9009');

  UserGender selectedGender = UserGender.male;

  final RegExp latLongRegex = RegExp(r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?((1[0-7]|[1-9])?\d(\.\d+)?|180(\.0+)?)$');


  DateTime? dob;
  TimeOfDay? time;
}
