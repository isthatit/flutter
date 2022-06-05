import 'package:calculator/getxPrac/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("getX Counter ${c.count}")),
      ),
      body: Center(
        child: Container(
          child: Obx(() => Text("count: ${c.count}")),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
