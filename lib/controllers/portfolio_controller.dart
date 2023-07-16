// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:rafaelgaedke/models/project.dart';

class PortfolioController extends GetxController {
  final RxList<Project> projects = RxList<Project>();

  @override
  void onInit() {
    super.onInit();
    projects.add(Project(title: "Facilittapp", site: 'facilittapp.com.br', img: 'assets/img/facilitapp.jpeg'));
    projects.add(Project(title: "Diarista Fácil", site: 'diaristafacil.com.br', img: 'assets/img/diarista.png'));
    projects.add(Project(title: "MyMime", site: 'fefe', img: 'assets/img/mime.png'));
    projects.add(Project(title: "OCPlay", site: 'ocplay.com.br', img: 'assets/img/ocplay.png'));
    projects.add(Project(title: "FEBIC", site: 'febic.com.br', img: 'assets/img/febic.jpeg'));
  }
}
