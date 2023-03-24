import 'package:astro_chat_ai/modules/home/bindings/home_binding.dart';
import 'package:astro_chat_ai/modules/home/views/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initialRoute = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
