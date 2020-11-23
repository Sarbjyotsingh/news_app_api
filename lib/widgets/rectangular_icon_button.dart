import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/utilities/colors.dart';

class RectangularButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  RectangularButtonWithIcon({
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: greyColor,
          )),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.grey,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
