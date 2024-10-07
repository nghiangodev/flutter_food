import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_food/utils/color_constant.dart';

class FooterPage extends StatefulWidget {
  @override
  _FooterPageState createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> imageUrls = [
    'assets/images/menu_1.png',
    'assets/images/menu_2.png',
    'assets/images/menu_3.png',
  ];

  List<AnimationController> _gradientColorControllers = [];
  int _currentIndex = 0;
  Timer? _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: -5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    for (int i = 0; i < imageUrls.length; i++) {
      var controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 5), // Transition duration
      )..addListener(() {
          setState(() {}); // Update UI
        });

      _gradientColorControllers.add(controller);
    }

    _pageController = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _timer?.cancel();
    for (var controller in _gradientColorControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  void _showImageModal(BuildContext context) {
    _currentIndex = 0;

    // Start the gradient animation for the first rectangle immediately when the modal opens
    _gradientColorControllers[_currentIndex].forward(from: 0);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    _timer?.cancel();
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(imageUrls.length, (index) {
                    return Expanded(
                      child: AnimatedBuilder(
                        animation: _gradientColorControllers[index],
                        builder: (context, child) {
                          Color currentColor = index == _currentIndex
                              ? Colors.white
                              : ColorConstants.primary;

                          return Container(
                            height: 4,
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              gradient: index == _currentIndex
                                  ? LinearGradient(
                                      colors: [
                                        ColorConstants.primary,
                                        Colors.white,
                                      ],
                                      stops: [
                                        0,
                                        _gradientColorControllers[index].value,
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    )
                                  : null,
                              color:
                                  index != _currentIndex ? Colors.white : null,
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );

    // Start the timer to change images after showing the modal
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      // Reset previous index animation
      _gradientColorControllers[_currentIndex]
          .reverse(from: 1); // Reset color to white

      setState(() {
        if (_currentIndex < imageUrls.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0; // Reset về đầu
        }
      });

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

      // Start animation for the new current index
      _gradientColorControllers[_currentIndex]
          .forward(from: 0); // Start animation for the new index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
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
                        fontSize: 12,
                        color: ColorConstants.primary,
                      ),
                    ),
                  ],
                ),
                label: '',
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
                        fontSize: 12,
                        color: ColorConstants.primary,
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
                activeIcon: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _animation.value),
                          child: Icon(
                            Icons.emoji_emotions,
                            size: 20,
                            color: ColorConstants.primary,
                          ),
                        );
                      },
                    ),
                    Text(
                      'GPT',
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorConstants.primary,
                      ),
                    ),
                  ],
                ),
                label: '',
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
                        fontSize: 12,
                        color: ColorConstants.primary,
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
            ],
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              color: ColorConstants.primary,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              color: ColorConstants.primary,
            ),
          ),
          Positioned(
            bottom: 20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                RotationTransition(
                  turns: _controller,
                  child: Container(
                    width: 43,
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
                        ],
                        stops: [
                          0.1,
                          0.3,
                          0.5,
                          0.7,
                          0.9,
                          1.0,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _showImageModal(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.primary,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/post.png',
                        width: 35,
                        height: 35,
                      ),
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
