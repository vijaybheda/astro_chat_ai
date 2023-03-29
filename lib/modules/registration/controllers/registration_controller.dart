import 'package:astro_chat_ai/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController timeOfBirthController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();

  UserGender selectedGender = UserGender.male;

  DateTime? dob;
  TimeOfDay? time;
}
