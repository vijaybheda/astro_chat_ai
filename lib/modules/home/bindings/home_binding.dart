import 'package:astro_chat_ai/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeBinding extends Bindings {
  final getStorage = GetStorage();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
