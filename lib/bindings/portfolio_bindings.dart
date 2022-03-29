import 'package:get/get.dart';
import 'package:testeweb/controllers/portfolio_controller.dart';

class PortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PortfolioController>(
      PortfolioController(),
    );
  }
}
