import 'package:astro_chat_ai/app_storage.dart';
import 'package:astro_chat_ai/services/route_service/router_config.dart';
import 'package:astro_chat_ai/services/route_service/routes_imp.dart';
import 'package:astro_chat_ai/services/route_service/routes_name.dart';
import 'package:astro_chat_ai/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(AppStorage()).initStorage();

  runApp(MyApp(
    routesConfig: RoutesImp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.routesConfig,
  });

  final RoutesConfig routesConfig;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AstroAI",
      darkTheme: ThemeColor().getThemeData(isDark: true),
      theme: ThemeColor().getThemeData(isDark: false),
      themeMode: ThemeMode.light,
      transitionDuration: const Duration(milliseconds: 500),
      defaultGlobalState: true,
      initialRoute: RoutesName.registration,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      getPages: routesConfig.getGetXPages(),
      onReady: () {},
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child!,
      ),
    );
  }
}
