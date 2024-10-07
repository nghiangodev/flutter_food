import 'package:flutter/material.dart';
import 'package:flutter_food/utils/color_constant.dart';

class FooterPage extends StatefulWidget {
  @override
  _FooterPageState createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Tạo controller cho animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600), // Tốc độ của animation
    )..repeat(reverse: true); // Lặp lại animation

    // Tạo tween để nhích icon lên trên
    _animation = Tween<double>(begin: 0, end: -5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Sử dụng easing để mượt mà hơn
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // Đặt chiều cao mong muốn
      child: Stack(
        alignment: Alignment.center, // Căn giữa để hình ảnh nằm chính giữa
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType
                .fixed, // Để các item có kích thước đồng đều
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.home,
                      size: 20,
                      color: ColorConstants.primary,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 12, // Set font size for the label
                        color: ColorConstants.primary,
                      ),
                    ),
                  ],
                ),
                label: '', // Set an empty string to hide the default label
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.search,
                      size: 20,
                      color: ColorConstants.primary,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 12, // Set font size for the label
                        color: ColorConstants.primary,
                      ),
                    ),
                  ],
                ),
                label: '', // Set an empty string to hide the default label
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Không hiển thị icon ở đây
                label: '',
                activeIcon: SizedBox
                    .shrink(), // Ẩn active icon để xử lý riêng với Positioned
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0,
                              _animation.value), // Di chuyển chỉ icon mặt cười
                          child: Icon(
                            Icons.emoji_emotions, // Sử dụng icon mặt cười
                            size: 20,
                            color: ColorConstants.primary,
                          ),
                        );
                      },
                    ),
                    // Label GPT không di chuyển
                    Text(
                      'GPT',
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.primary,
                      ),
                    ),
                  ],
                ),
                label: '', // Set an empty string to hide the default label
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.support,
                      size: 20,
                      color: ColorConstants.primary,
                    ),
                    Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 12, // Set font size for the label
                        color: ColorConstants.primary,
                      ),
                    ),
                  ],
                ),
                label: '', // Set an empty string to hide the default label
              ),
            ],
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              color: ColorConstants.primary, // Màu cho label được chọn
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              color: ColorConstants.primary, // Màu cho label không được chọn
            ),
          ),
          // Hình ảnh nằm bên trên và nhích lên trên
          Positioned(
            bottom: 20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Phần viền có hiệu ứng xoay vòng tròn
                RotationTransition(
                  turns: _controller, // Sử dụng controller để tạo hiệu ứng xoay
                  child: Container(
                    width: 43, // Đặt kích thước lớn hơn để chứa cả viền
                    height: 43,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          ColorConstants.primary_50,
                          ColorConstants.primary_100,
                          ColorConstants.primary_200,
                          ColorConstants.primary_300,
                          ColorConstants.primary_400,
                          ColorConstants.primary_500,
                        ], // Màu gradient cho viền
                        stops: [
                          0.1,
                          0.3,
                          0.5,
                          0.7,
                          0.9,
                          1.0
                        ], // Điều chỉnh màu sắc dọc theo viền
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                // Hình ảnh ở giữa
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstants.primary,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/post.png', // Thay thế bằng đường dẫn thực tế đến hình ảnh của bạn
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
