import 'package:flutter/material.dart';
import 'package:flutter_food/views/home/layout/header_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderPage(),
      body: Center(
        child: Text('This is the content of SomePage.'),
      ),
    );
  }
}
