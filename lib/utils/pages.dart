import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rafaelgaedke/components/bindings/home_bindings.dart';
import 'package:rafaelgaedke/components/bindings/home_tab_bindings.dart';
import 'package:rafaelgaedke/components/bindings/portfolio_bindings.dart';
import 'package:rafaelgaedke/pages/home.dart';
import 'package:rafaelgaedke/pages/home_tab.dart';
import 'package:rafaelgaedke/pages/not_found.dart';
import 'package:rafaelgaedke/pages/portifolio.dart';

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
