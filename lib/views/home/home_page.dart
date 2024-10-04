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
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
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
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          if (!buttonStates[day]!) {
                            buttonStates[day] = true;

                            for (final otherDay in daysOfWeek) {
                              if (otherDay != day) {
                                buttonStates[otherDay] = false;
                              }
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonStates[day]!
                            ? ColorConstants.primary_400
                            : ColorConstants.primary_50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide.none,
                        ),
                        elevation: 0,
                        side: BorderSide.none,
                      ),
                      child: Text(day,
                          style: TextStyle(
                            color: buttonStates[day]!
                                ? Colors.white
                                : ColorConstants.primary,
                          )),
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
      ),
      bottomNavigationBar: FooterPage(),
    );
  }
}
