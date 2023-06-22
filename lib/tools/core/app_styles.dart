import 'package:flutter/material.dart';
import 'package:tmdb_test/tools/index.dart';

class AppStyle {
  static const smallBlackText = TextStyle(
    fontFamily: 'ProximaNova-Semibold',
    fontSize: 12,
    color: AppColors.darkColor,
  );

  static const regularBlackText = TextStyle(
    fontFamily: 'ProximaNova-Semibold',
    fontSize: 16,
    color: AppColors.darkColor,
  );

  static const mediumBlackText = TextStyle(
    fontFamily: 'ProximaNova-Bold',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.darkColor,
  );

  static const bigBlackText = TextStyle(
    fontFamily: 'ProximaNova-Bold',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.darkColor,
  );

  static const globalErrorText = TextStyle(
    fontFamily: 'ProximaNova-Semibold',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.errorColor,
  );
}
