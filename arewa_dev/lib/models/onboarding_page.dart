import 'package:arewa_dev/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final bool isLastPage;
  final VoidCallback? onGetStarted;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    this.isLastPage = false,
    this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(height: 150.h),
        Center(child: Image.asset(iconPath, height: 150.h, fit: BoxFit.cover)),
        SizedBox(height: 20.h),
        Container(
          height: 250.h,

          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.7],
              colors: [
                Color.fromARGB(255, 41, 41, 41),
                // Color(0xFF696969),
                Color.fromARGB(255, 149, 145, 145),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 36.sp,
                    // fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  description,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ), // Replace with your actual widget
        ),
      ],
    );
  }
}
