import 'package:flutter/material.dart';
import 'package:flutter_food/views/home/banner_page.dart';
import 'package:flutter_food/views/home/home_page.dart';
import 'package:flutter_food/views/home/layout/main_theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      theme: mainTheme,
      initialRoute: '/banner',
      getPages: [
        GetPage(name: '/banner', page: () => BannerPage()),
        GetPage(name: '/', page: () => HomePage()),
      ],
    );
  }
}
