import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafaelgaedke/utils/languages/app_location.dart';
import 'package:rafaelgaedke/utils/pages.dart';
import 'package:rafaelgaedke/utils/routes.dart';
import 'package:rafaelgaedke/utils/strings.dart';
import 'package:rafaelgaedke/web_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialização específica para web
  await initializeWeb();

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
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
