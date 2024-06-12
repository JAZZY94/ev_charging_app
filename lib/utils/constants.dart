import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xfff020819);
  static const Color textColor = Color(0xfffF9FAFB);
  static const Color subtitleTextColor = Color(0xfff667085);
  static const containerColor = Color(0xff1D2939);
  static const containerTextColor = Color(0xffF7F9FC);
  static const containerSubtitleTextColor = Color(0xff8E94A4);
}

class AppTextStyles {
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle containerTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.containerTextColor,
  );
  static const TextStyle containerSubtitleTextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.containerSubtitleTextColor,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.subtitleTextColor,
  );

  static const TextStyle smallTextStyle = TextStyle(
    height: 1.5,
    fontSize: 12,
    color: AppColors.subtitleTextColor,
  );

  static const TextStyle smallTextStyleWhite = TextStyle(
    fontSize: 12,
    color: AppColors.textColor,
  );
}
