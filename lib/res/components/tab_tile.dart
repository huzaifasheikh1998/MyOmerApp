import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';

Widget tabTile(String image, String title) {
  return ListTile(
    leading: Image.asset(
      image,
      color: AppColors.primaryColor,
      height: 24,
    ),
    title: Content(
      data: title,
      size: 16,
      color: AppColors.primaryColor,
      weight: FontWeight.w600,
    ),
    trailing: Icon(
      Icons.arrow_forward,
      color: AppColors.primaryColor,
    ),
  );
}
