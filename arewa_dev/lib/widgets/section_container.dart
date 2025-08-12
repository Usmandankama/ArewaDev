import 'package:arewa_dev/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionContainer extends StatefulWidget {
  const SectionContainer({
    super.key,
    required this.containerHeight,
    required this.containerWidth,
    required this.title,
    required this.subtitle,
    required this.sectionColor,
    required this.nextScreen,
    required this.imagePath,
  });
  final int containerHeight;
  final int containerWidth;
  final String title;
  final String subtitle;
  final Color sectionColor;
  final Widget nextScreen;
  final String imagePath;
  @override
  State<SectionContainer> createState() => _SectionContainerState();
}
class _SectionContainerState extends State<SectionContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.nextScreen),
        );
      },
      child: Container(
        // height: widget.containerHeight.h,
        height: 180.h,
        width: 150.h,
        // width: widget.containerWidth.w,
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: widget.sectionColor,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15.sp),
            ),
            SizedBox(height: 5.h),
            Text(
              widget.subtitle,
              style: GoogleFonts.montserrat(color:  AppColors.textSecondary, fontSize: 12.sp,fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}