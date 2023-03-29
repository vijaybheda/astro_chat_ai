import 'package:astro_chat_ai/modules/registration/controllers/registration_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegistrationBinding extends Bindings {
  final getStorage = GetStorage();

  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(
      () => RegistrationController(),
    );
  }
}
