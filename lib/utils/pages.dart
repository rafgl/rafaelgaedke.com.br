import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testeweb/bindings/home_bindings.dart';
import 'package:testeweb/bindings/home_tab_bindings.dart';
import 'package:testeweb/bindings/portfolio_bindings.dart';
import 'package:testeweb/pages/home.dart';
import 'package:testeweb/pages/home_tab.dart';
import 'package:testeweb/pages/not_found.dart';
import 'package:testeweb/pages/portifolio.dart';

import 'routes.dart';

class AppPages {
  static GetPage get notFound => GetPage(
        name: Routes.notFound,
        page: () => const NotFoundPage(),
      );
  static List<GetPage> get pages => [
        GetPage(
          name: Routes.homeTab,
          page: () => const HomeTabPage(),
          binding: HomeTabBinding(),
        ),
        GetPage(
          name: Routes.home,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.portfolio,
          page: () => const PortfolioPage(),
          binding: PortfolioBinding(),
        ),
      ];
}
