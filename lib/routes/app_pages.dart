import 'package:astro_chat_ai/modules/chart_image/bindings/chart_image_binding.dart';
import 'package:astro_chat_ai/modules/chart_image/views/chart_image_view.dart';
import 'package:astro_chat_ai/modules/home/bindings/home_binding.dart';
import 'package:astro_chat_ai/modules/home/views/home_view.dart';
import 'package:astro_chat_ai/modules/registration/bindings/registration_binding.dart';
import 'package:astro_chat_ai/modules/registration/views/registration_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initialRoute = Routes.registration;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.chartImage,
      page: () => const ChartImageScreen(),
      binding: ChartImageBinding(),
    ),
    GetPage(
      name: _Paths.registration,
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
  ];
}
