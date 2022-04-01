import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafaelgaedke/components/line_horizontal.dart';
import 'package:rafaelgaedke/controllers/home_controller.dart';
import 'package:rafaelgaedke/utils/Strings.dart';
import 'package:rafaelgaedke/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Stack(
        children: [
          Container(
              alignment: Alignment.center,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      style:
                          const TextStyle(fontSize: 13, fontFamily: "NotoSans"),
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
                  const SizedBox(height: 50),
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
                          var url =
                              'https://docs.google.com/document/d/1xjhE_9hfJymCKrNs_MG1PjryGAqf9Zrd3zu-SI8V9Hg/edit';

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
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () async {
                          var url = 'https://www.facebook.com/rafael.gaedke/';

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            if (kDebugMode) {
                              print('Failed to open phone url $url');
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.facebook_outlined,
                          color: Color(0xff3d4154),
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          var url = 'mailto:rafaelgaedke@gmail.com';

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            if (kDebugMode) {
                              print('Failed to open phone url $url');
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.alternate_email_outlined,
                          color: Color(0xff3d4154),
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          var url = 'tel:+5547997017721';

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            if (kDebugMode) {
                              print('Failed to open phone url $url');
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.phone_android,
                          color: Color(0xff3d4154),
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: IconButton(
                          onPressed: () async {
                            var url = 'http://twitter.com/rafs_gl';

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              if (kDebugMode) {
                                print('Failed to open phone url $url');
                              }
                            }
                          },
                          icon: Image.asset(
                            "assets/img/twitter.png",
                            width: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: IconButton(
                          onPressed: () async {
                            var url = 'https://www.linkedin.com/in/rafgls/';

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              if (kDebugMode) {
                                print('Failed to open phone url $url');
                              }
                            }
                          },
                          icon: Image.asset(
                            "assets/img/logotipo-do-linkedin.png",
                            width: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.asset(
          'assets/img/Pessoas.png',
          width: width,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
