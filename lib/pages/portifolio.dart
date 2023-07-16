import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafaelgaedke/controllers/portfolio_controller.dart';
import 'package:rafaelgaedke/utils/colors.dart';

class PortfolioPage extends GetView<PortfolioController> {
  const PortfolioPage({Key? key}) : super(key: key);

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
          alignment: Alignment.center,
          child: Stack(children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook_outlined,
                        color: Color(0xff3d4154),
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.alternate_email_outlined,
                        color: Color(0xff3d4154),
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone_android,
                        color: Color(0xff3d4154),
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/logotipo-do-linkedin.png",
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Text(
                        "All Projects",
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w300,
                          color: MyColors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 120,
                      height: 500,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.projects.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 1000,
                                  height: 300,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Image.asset(controller.projects[index].img.toString(), height: 100),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                            ),
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
                                                  child: Text(
                                                    controller.projects[index].title.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w500, color: MyColors.red, fontFamily: "NotoSans"),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0, top: 10, bottom: 0, right: 0),
                                                  // ignore: deprecated_member_use
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    // color: MyColors.red,
                                                    // padding: const EdgeInsets
                                                    // .fromLTRB(30, 2, 30, 2),
                                                    child: const Text(
                                                      'Ver mais detalhes',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const ButtonBar(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ]))
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
