import 'package:astro_chat_ai/modules/chart_image/controllers/chart_image_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChartImageBinding extends Bindings {
  final getStorage = GetStorage();

  @override
  void dependencies() {
    Get.lazyPut<ChartImageController>(() => ChartImageController());
  }
}
