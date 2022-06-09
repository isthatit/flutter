import 'package:flutter/material.dart';
// import 'package:flutter_book_list/screens/list_screen.dart';
import 'package:flutter_book_list/getx_screens/list_screen.dart';
import 'package:get/get.dart';

void main() {
  // 기본 상태관리
  // runApp(MyApp());

  // getX 상태관리
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List App',
      home: ListScreen(),
      // home: DetailScreen(),
    );
  }
}
