import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testeweb/components/line_horizontal.dart';
import 'package:testeweb/controllers/home_controller.dart';
import 'package:testeweb/utils/Strings.dart';
import 'package:testeweb/utils/colors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Stack(
        children: [
          // Positioned(
          //   bottom: 15,
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Row(
          //       children: [
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(
          //             Icons.facebook_outlined,
          //             color: Color(0xff3d4154),
          //             size: 30,
          //           ),
          //         ),
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(
          //             Icons.alternate_email_outlined,
          //             color: Color(0xff3d4154),
          //             size: 30,
          //           ),
          //         ),
          //         IconButton(
          //           onPressed: () {},
          //           icon: const Icon(
          //             Icons.phone_android,
          //             color: Color(0xff3d4154),
          //             size: 30,
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 5),
          //           child: IconButton(
          //             onPressed: () {},
          //             icon: Image.asset(
          //               "assets/img/logotipo-do-linkedin.png",
          //               width: 30,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
                            fontSize: 68,
                            color: Color(0xff3d4154),
                          ),
                        ),
                        const TextSpan(
                          text: 'Rafael ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 68,
                            color: MyColors.red,
                          ),
                        ),
                        const TextSpan(
                          text: 'Mendonça',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 68,
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
                        onPressed: () async {},
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
