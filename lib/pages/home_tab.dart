import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testeweb/controllers/home_tab_controller.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:testeweb/pages/home.dart';
import 'package:testeweb/services/storage.dart';
import 'package:testeweb/utils/colors.dart';
import 'package:testeweb/utils/config.dart';
import 'package:testeweb/utils/languages/app_location.dart';
import 'package:testeweb/utils/strings.dart';

class HomeTabPage extends GetView<HomeTabController> {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xffecf1fd),
          actions: [
            TextButton(
              onPressed: () {
                StorageService.box.write(Config.LANGUAGE, 'English');
                controller.selectedLang.value = 'English';
                LocalizationService().changeLocale('English');
              },
              child: Text(
                "EUA",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: StorageService.box.read(Config.LANGUAGE) == "English" ? MyColors.red : Colors.grey,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                StorageService.box.write(Config.LANGUAGE, 'Português');
                controller.selectedLang.value = 'Português';
                LocalizationService().changeLocale('Português');
              },
              child: Text(
                "BR",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: StorageService.box.read(Config.LANGUAGE) == "Português" ? MyColors.red : Colors.grey,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                StorageService.box.write(Config.LANGUAGE, 'Español');
                controller.selectedLang.value = 'Español';
                LocalizationService().changeLocale('Español');
              },
              child: Text(
                "ES",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: StorageService.box.read(Config.LANGUAGE) == "Español" ? MyColors.red : Colors.grey,
                ),
              ),
            ),
          ],
          elevation: 0.0,
          title: TabBar(
            controller: controller.tabController,
            labelColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.pink, width: 2),
              insets: EdgeInsets.only(
                bottom: 7.0,
              ),
            ),
            isScrollable: true,
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            tabs: [
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 100,
                alignment: Alignment.center,
                height: 40,
                child: Obx(
                  () => AutoSizeText(
                    Strings.home.tr,
                    maxFontSize: 14,
                    minFontSize: 8,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // ignore: unrelated_type_equality_checks
                      color: controller.currentIndex.value == 0 ? MyColors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(5.0),
              //   width: 100,
              //   height: 40,
              //   alignment: Alignment.center,
              //   child: Obx(
              //     () => AutoSizeText(
              //       Strings.about.tr,
              //       maxFontSize: 14,
              //       minFontSize: 8,
              //       maxLines: 1,
              //       style: TextStyle(
              //         fontWeight: FontWeight.w600,
              //         // ignore: unrelated_type_equality_checks
              //         color: controller.currentIndex.value == 1
              //             ? MyColors.red
              //             : Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.all(5.0),
              //   width: 100,
              //   height: 40,
              //   alignment: Alignment.center,
              //   child: Obx(
              //     () => AutoSizeText(
              //       Strings.service.tr,
              //       maxFontSize: 14,
              //       minFontSize: 8,
              //       maxLines: 1,
              //       style: TextStyle(
              //         fontWeight: FontWeight.w600,
              //         // ignore: unrelated_type_equality_checks
              //         color: controller.currentIndex.value == 2
              //             ? MyColors.red
              //             : Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.all(5.0),
              //   width: 100,
              //   height: 40,
              //   alignment: Alignment.center,
              //   child: Obx(
              //     () => AutoSizeText(
              //       Strings.portfolio.tr,
              //       maxFontSize: 14,
              //       minFontSize: 8,
              //       maxLines: 1,
              //       style: TextStyle(
              //         fontWeight: FontWeight.w600,
              //         // ignore: unrelated_type_equality_checks
              //         color: controller.currentIndex.value == 3
              //             ? MyColors.red
              //             : Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.all(5.0),
              //   width: 100,
              //   height: 40,
              //   alignment: Alignment.center,
              //   child: Obx(
              //     () => AutoSizeText(
              //       Strings.contact.tr,
              //       maxFontSize: 14,
              //       minFontSize: 8,
              //       maxLines: 1,
              //       style: TextStyle(
              //         fontWeight: FontWeight.w600,
              //         // ignore: unrelated_type_equality_checks
              //         color: controller.currentIndex.value == 4
              //             ? MyColors.red
              //             : Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          excludeHeaderSemantics: true,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xffecf1fd),
        child: TabBarView(
          controller: controller.tabController,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: const HomePage(),
            )),
          ],
        ),
      ),
    );
  }
}
