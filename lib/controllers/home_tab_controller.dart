// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testeweb/services/storage.dart';
import 'package:testeweb/utils/config.dart';

class HomeTabController extends GetxController
    with SingleGetTickerProviderMixin {
  RxString selectedLang =
      RxString(StorageService.box.read(Config.LANGUAGE) ?? 'English');

  final RxInt currentIndex = 0.obs;
  DateTime? currentBackPressTime;
  RxString? nameDevice = ''.obs;
  double? indicatorSize = 12;
  TabController? tabController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(
    debugLabel: 'TabContainerComponent',
  );

  updateTab(int index) {
    if (index == currentIndex.value) return;
    currentIndex.value = index;
    if (tabController != null) {
      tabController!.animateTo(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  void onInit() async {
    tabController = TabController(
      length: 1,
      vsync: this,
    );

    super.onInit();
  }
}
