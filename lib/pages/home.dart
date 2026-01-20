import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafaelgaedke/components/animated_fade_in.dart';
import 'package:rafaelgaedke/components/line_horizontal.dart';
import 'package:rafaelgaedke/components/tech_chip.dart';
import 'package:rafaelgaedke/controllers/home_controller.dart';
import 'package:rafaelgaedke/utils/Strings.dart';
import 'package:rafaelgaedke/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2.2, height),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width, height / 2),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width, double height) {
    return <Widget>[
      Container(
        alignment: Alignment.center,
        width: width,
        height: height + 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedFadeIn(
              delay: const Duration(milliseconds: 100),
              child: Row(
                children: [
                  CustomPaint(painter: Drawhorizontalline(true)),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      Strings.hello.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color(0xff3d4154),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedFadeIn(
              delay: const Duration(milliseconds: 300),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 13, fontFamily: "NotoSans"),
                  children: <TextSpan>[
                    TextSpan(
                      text: "${Strings.iam.tr} ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 55,
                        color: Color(0xff3d4154),
                      ),
                    ),
                    const TextSpan(
                      text: 'Rafael ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 55,
                        color: MyColors.red,
                      ),
                    ),
                    const TextSpan(
                      text: 'Mendonça',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 55,
                        color: Color(0xff3d4154),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedFadeIn(
              delay: const Duration(milliseconds: 400),
              child: SizedBox(
                width: 500,
                child: Text(
                  Strings.msg.tr,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff9398a0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const AnimatedFadeIn(
              delay: Duration(milliseconds: 500),
              child: Wrap(
                children: [
                  TechChip(label: 'Flutter', icon: Icons.phone_android),
                  TechChip(label: 'Dart', icon: Icons.code),
                  TechChip(label: 'iOS', icon: Icons.phone_iphone),
                  TechChip(label: 'Swift', icon: Icons.developer_mode),
                  TechChip(label: 'Kotlin', icon: Icons.android),
                ],
              ),
            ),
            const SizedBox(height: 24),
            AnimatedFadeIn(
              delay: const Duration(milliseconds: 600),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      backgroundColor: MyColors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                    ),
                    onPressed: () async {
                      var url = Uri.parse('https://docs.google.com/document/d/1xjhE_9hfJymCKrNs_MG1PjryGAqf9Zrd3zu-SI8V9Hg/edit');

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        if (kDebugMode) {
                          print('Failed to open phone url $url');
                        }
                      }
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.description, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Acessar CV',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedFadeIn(
              delay: const Duration(milliseconds: 700),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _icon(path: 'https://www.linkedin.com/in/rafgls/', iconWidget: Icons.work_outline, color: const Color(0xFF0077B5)),
                  const SizedBox(width: 12),
                  _icon(path: 'mailto:rafaelgaedke@gmail.com', iconWidget: Icons.alternate_email, color: MyColors.red),
                  const SizedBox(width: 12),
                  _icon(path: 'https://github.com/rafgl', iconWidget: Icons.code, color: const Color(0xff3d4154)),
                ],
              ),
            ),
          ],
        ),
      ),
      AnimatedFadeIn(
        delay: const Duration(milliseconds: 400),
        child: Container(
          width: width,
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            radius: 250,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.asset("assets/img/eu.jpg"),
            ),
          ),
        ),
      ),
    ];
  }

  Widget _icon({IconData? iconWidget, String? path, Color? color}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          var uri = Uri.parse(path ?? '');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            if (kDebugMode) {
              print('Failed to open phone url $path');
            }
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            iconWidget,
            size: 28,
            color: color ?? const Color(0xff3d4154),
          ),
        ),
      ),
    );
  }
}
