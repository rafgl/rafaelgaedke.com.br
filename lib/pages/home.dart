import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rafaelgaedke/components/line_horizontal.dart';
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
            children: pageChildren(constraints.biggest.width / 2, height),
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
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
            RichText(
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
            const SizedBox(height: 20),
            SizedBox(
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
            const SizedBox(height: 13),
            Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20),
                width: 200,
                height: 40,
                // ignore: deprecated_member_use
                child: FlatButton(
                  highlightColor: Colors.blue.withOpacity(0.1),
                  onPressed: () async {
                    var url = 'https://docs.google.com/document/d/1xjhE_9hfJymCKrNs_MG1PjryGAqf9Zrd3zu-SI8V9Hg/edit';

                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      if (kDebugMode) {
                        print('Failed to open phone url $url');
                      }
                    }
                  },
                  padding: const EdgeInsets.all(0.0),
                  color: MyColors.red,
                  minWidth: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Download CV',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _icon(path: 'https://www.facebook.com/rafael.gaedke/', iconWidget: Icons.facebook_outlined),
                _icon(path: 'mailto:rafaelgaedke@gmail.com', iconWidget: Icons.alternate_email_outlined),
                _icon(path: 'tel:+5547997017721', iconWidget: Icons.phone_android),
                _icon(path: 'http://twitter.com/rafs_gl', iconWidget: MdiIcons.twitter),
                _icon(path: 'https://www.linkedin.com/in/rafgls/', iconWidget: MdiIcons.linkedin),
                _icon(path: 'https://github.com/rafgl', iconWidget: MdiIcons.github),
                _icon(path: 'https://www.youtube.com/channel/UCiMqRRVZ72FKi_XM86_oNGA', iconWidget: MdiIcons.youtube),
              ],
            ),
          ],
        ),
      ),
      Container(
        width: width,
        alignment: Alignment.centerRight,
        child: CircleAvatar(
          radius: (250),
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image.asset("assets/img/eu.png"),
          ),
        ),
      ),
    ];
  }

  Widget _icon({IconData? iconWidget, String? path}) {
    return IconButton(
      onPressed: () async {
        if (await canLaunch(path!)) {
          await launch(path);
        } else {
          if (kDebugMode) {
            print('Failed to open phone url $path');
          }
        }
      },
      icon: Icon(iconWidget, size: 32),
    );
  }
}
