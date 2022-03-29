import 'package:flutter/material.dart';
import 'package:testeweb/utils/languages/app_location.dart';
import 'package:testeweb/utils/pages.dart';
import 'package:testeweb/utils/routes.dart';
import 'package:testeweb/utils/strings.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      popGesture: false,
      title: Strings.home,
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