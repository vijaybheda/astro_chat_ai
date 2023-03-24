import 'package:astro_chat_ai/app_storage.dart';
import 'package:astro_chat_ai/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/route_service/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(AppStorage()).initStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AstroAI",
      initialRoute: RoutesName.home,
      darkTheme: ThemeColor().getThemeData(isDark: true),
      theme: ThemeColor().getThemeData(isDark: false),
      themeMode: ThemeMode.light,
      transitionDuration: const Duration(milliseconds: 500),
      defaultTransition: Transition.rightToLeft,
      defaultGlobalState: true,
      onReady: () {},
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child!,
      ),
    );
  }
}
