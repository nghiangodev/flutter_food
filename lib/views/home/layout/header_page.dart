import 'package:flutter/material.dart';
import 'package:flutter_food/utils/color_constant.dart';

class HeaderPage extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(40.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: ColorConstants.primary_600),
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
        ),
      ],
    );
  }
}
