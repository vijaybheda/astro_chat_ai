import 'package:astro_chat_ai/modules/home/bindings/home_binding.dart';
import 'package:astro_chat_ai/modules/home/views/home_view.dart';
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
    ];
  }
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}
