import 'package:arewa_dev/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearnHtml extends StatefulWidget {
  const LearnHtml({super.key});

  @override
  State<LearnHtml> createState() => _LearnHtmlState();
}

class _LearnHtmlState extends State<LearnHtml> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: AppColors.textPrimary,
        title: Text(
          'Learn HTML',
          style: TextStyle(color: AppColors.textPrimary, fontSize: 20.sp),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Card(
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    'Introduction to HTML',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    'Introduction to HTML',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    'Introduction to HTML',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    'Introduction to HTML',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    'Introduction to HTML',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    'Introduction to HTML',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    'Introduction to HTML',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
