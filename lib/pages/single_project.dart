import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testeweb/controllers/single_project_controller.dart';

class SingleProjectPage extends GetView<SingleProjectController> {
  const SingleProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SingleProjectPage')),
        body: SafeArea(child: Text('SingleProjectController')));
  }
}
