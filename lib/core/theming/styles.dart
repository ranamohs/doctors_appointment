import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles{
  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black
  );

  static TextStyle font32Blue700Weight = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.mainBlue
  );

  static TextStyle font10Gray400Weight = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.mainGray
  );


  static TextStyle font16White600Weight = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.mainWhite
  );
}