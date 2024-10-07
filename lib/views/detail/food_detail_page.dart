import 'package:flutter/material.dart';
import 'package:flutter_food/utils/color_constant.dart';

class FoodDetailPage extends StatefulWidget {
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int _selectedTabIndex = 0; // Initially select the first tab

  final List<String> _tabTitles = [
    'Overview',
    'Ingredients',
    'Instructions',
    'Reviews',
  ];

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
          // Image and difficulty level
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
          // Avatar and food info
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/icon/user.png'),
                  // Replace with your avatar image
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
          // Horizontal navigation bar
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
          // Content sections (replace with your actual content)
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
    // Replace with your content for each section
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
