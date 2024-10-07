import 'package:flutter/material.dart';
import 'package:flutter_food/utils/color_constant.dart';
import 'package:flutter_food/views/home/layout/card_food.dart';
import 'package:flutter_food/views/home/layout/footer_page.dart';
import 'package:flutter_food/views/home/layout/header_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> daysOfWeek = [
    'Thứ hai',
    'Thứ ba',
    'Thứ tư',
    'Thứ năm',
    'Thứ sáu',
    'Thứ bảy',
    'Chủ nhật',
  ];

  Map<String, bool?> buttonStates = {};

  @override
  void initState() {
    super.initState();
    for (final day in daysOfWeek) {
      buttonStates[day] = false;
    }
    buttonStates[daysOfWeek.first] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: HeaderPage(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/banner_menu.png',
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'DANH SÁCH THỰC ĐƠN',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: ColorConstants.primary_400,
                    ),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: daysOfWeek.map((day) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              for (final otherDay in daysOfWeek) {
                                buttonStates[otherDay] = otherDay == day;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: buttonStates[day]!
                                    ? ColorConstants.primary
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                            elevation: buttonStates[day]! ? 4 : 0,
                            backgroundColor: buttonStates[day]!
                                ? ColorConstants.primary_50
                                : Colors
                                    .transparent, // Set the button background color
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/icon/$day.png', // Replace with your actual image path
                                  width: 50, // Adjust the size as needed
                                  height: 50,
                                ), // Custom image above the text
                                SizedBox(height: 8.0),
                                Text(
                                  day,
                                  style: TextStyle(
                                    color: buttonStates[day]!
                                        ? ColorConstants.primary
                                        : ColorConstants.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ), // Text below the icon
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Buổi Trưa',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CardFood(
                          imageAsset: 'assets/images/menu_1.png',
                          title: 'Hậu xào đậu que',
                          description: 'Món ngon mỗi ngày',
                        ),
                        CardFood(
                          imageAsset: 'assets/images/menu_2.png',
                          title: 'Phúc kho trứng cút',
                          description: 'Món ngon mỗi ngày',
                        ),
                        CardFood(
                          imageAsset: 'assets/images/menu_3.png',
                          title: 'Canh Phát xít',
                          description: 'Món ngon mỗi ngày',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Buổi Tối',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CardFood(
                          imageAsset: 'assets/images/menu_1.png',
                          title: 'Hậu xào đậu que',
                          description: 'Món ngon mỗi ngày',
                        ),
                        CardFood(
                          imageAsset: 'assets/images/menu_2.png',
                          title: 'Phúc kho trứng cút',
                          description: 'Món ngon mỗi ngày',
                        ),
                        CardFood(
                          imageAsset: 'assets/images/menu_3.png',
                          title: 'Canh Phát xít',
                          description: 'Món ngon mỗi ngày',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterPage(),
    );
  }
}
