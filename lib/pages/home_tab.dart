import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafaelgaedke/controllers/home_tab_controller.dart';
import 'package:rafaelgaedke/pages/home.dart';
import 'package:rafaelgaedke/services/storage.dart';
import 'package:rafaelgaedke/utils/colors.dart';
import 'package:rafaelgaedke/utils/config.dart';
import 'package:rafaelgaedke/utils/languages/app_location.dart';

class HomeTabPage extends GetView<HomeTabController> {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xffecf1fd),
      child: TabBarView(
        controller: controller.tabController,
        children: const [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: HomePage(),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffecf1fd),
        elevation: 0.0,
        title: Row(
          children: [
            _textbutton(
              onPressed: () {
                StorageService.box.write(Config.LANGUAGE, 'English');
                controller.selectedLang.value = 'English';
                LocalizationService().changeLocale('English');
              },
              language: 'EUA',
              languageDefined: 'English',
            ),
            _textbutton(
              onPressed: () {
                StorageService.box.write(Config.LANGUAGE, 'Português');
                controller.selectedLang.value = 'Português';
                LocalizationService().changeLocale('Português');
              },
              language: 'BR',
              languageDefined: 'Português',
            ),
            _textbutton(
              onPressed: () {
                StorageService.box.write(Config.LANGUAGE, 'Español');
                controller.selectedLang.value = 'Español';
                LocalizationService().changeLocale('Español');
              },
              language: 'ES',
              languageDefined: 'Español',
            ),
          ],
        ),
      ),
    );
  }

  TextButton _textbutton({Function()? onPressed, String? language, String? languageDefined}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        language!,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: StorageService.box.read(Config.LANGUAGE) == languageDefined ? MyColors.red : Colors.grey,
        ),
      ),
    );
  }
}
