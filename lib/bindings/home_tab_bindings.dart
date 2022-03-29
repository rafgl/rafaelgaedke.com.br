import 'package:testeweb/controllers/home_controller.dart';
import 'package:testeweb/controllers/home_tab_controller.dart';
import 'package:get/get.dart';
import 'package:testeweb/controllers/portfolio_controller.dart';

class HomeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeTabController>(
      HomeTabController(),
    );
    Get.put<PortfolioController>(
      PortfolioController(),
    );
    Get.put<HomeController>(
      HomeController(),
    );
  }
}
