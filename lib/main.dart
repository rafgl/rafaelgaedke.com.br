import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:rafaelgaedke/utils/languages/app_location.dart';
import 'package:rafaelgaedke/utils/pages.dart';
import 'package:rafaelgaedke/utils/routes.dart';
import 'package:rafaelgaedke/utils/strings.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      popGesture: false,
      title: Strings.title,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeTab,
      unknownRoute: AppPages.notFound,
      getPages: AppPages.pages,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Roboto",
      ),
    );
  }
}
