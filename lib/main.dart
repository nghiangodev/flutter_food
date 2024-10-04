import 'package:flutter/material.dart';
import 'package:flutter_food/views/home/banner_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => BannerPage()),
      ],
    );
  }
}
