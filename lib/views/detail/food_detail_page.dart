import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Dùng để đọc file JSON từ assets
import 'package:flutter_food/utils/color_constant.dart';
import 'package:flutter_food/models/detail.dart';

class FoodDetailPage extends StatefulWidget {
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int _selectedTabIndex = 0;
  Dish? _dish; // Biến lưu trữ dữ liệu món ăn

  final List<String> _tabTitles = [
    'Overview',
    'Ingredients',
    'Instructions',
    'Reviews',
  ];

  @override
  void initState() {
    super.initState();
    _loadDishData(); // Tải dữ liệu món ăn
  }

  Future<void> _loadDishData() async {
    final String response = await rootBundle.loadString(
        'assets/media/detail.json'); // Đường dẫn tới file JSON của bạn
    final data = json.decode(response);
    setState(() {
      _dish = Dish.fromJson(
          data['data']); // Chuyển đổi dữ liệu JSON thành đối tượng Dish
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.primary_600),
        title: Text(
          'Delicious Pasta',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                'assets/images/menu_2.png',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/icon/user.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delicious Pasta',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Italian Cuisine',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _tabTitles.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _selectedTabIndex == index
                            ? ColorConstants.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    _tabTitles[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _selectedTabIndex == index
                          ? ColorConstants.primary
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildContentSection(_selectedTabIndex),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return Text('Overview content');
      case 1:
        return Text('Ingredients content');
      case 2:
        return Text('Instructions content');
      case 3:
        return Text('Reviews content');
      default:
        return Container();
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: FoodDetailPage(),
  ));
}
