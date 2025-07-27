import 'package:arewa_dev/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onPressed});
  final VoidCallback? onPressed;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 26.h,
        width: 44.w,
        decoration: BoxDecoration(
          color: AppColors.textPrimary,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.backgroundColor,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
