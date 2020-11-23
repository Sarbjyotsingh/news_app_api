import 'package:flutter/material.dart';
import 'package:news_app_api/utilities/colors.dart';

SnackBar showSnackBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: primaryColor,
    duration: Duration(seconds: 2),
  );
}
