import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Center(
        child: Text('This is the user info page.'),
      ),
    );
  }
}

// Thêm một route khác
class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('This is the settings page.'),
      ),
    );
  }
}
