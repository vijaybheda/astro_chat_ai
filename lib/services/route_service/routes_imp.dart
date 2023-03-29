import 'package:astro_chat_ai/modules/chart_image/bindings/chart_image_binding.dart';
import 'package:astro_chat_ai/modules/chart_image/views/chart_image_view.dart';
import 'package:astro_chat_ai/modules/home/bindings/home_binding.dart';
import 'package:astro_chat_ai/modules/home/views/home_view.dart';
import 'package:astro_chat_ai/modules/registration/bindings/registration_binding.dart';
import 'package:astro_chat_ai/modules/registration/views/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'router_config.dart';
import 'routes_name.dart';

class RoutesImp implements RoutesConfig {
  @override
  List<GetPage> getGetXPages() {
    return [
      GetPage(
        name: RoutesName.login,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: RoutesName.chartImage,
        page: () => const ChartImageScreen(),
        binding: ChartImageBinding(),
      ),
      GetPage(
        name: RoutesName.registration,
        page: () => const RegistrationScreen(),
        binding: RegistrationBinding(),
      ),
    ];
  }
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}
