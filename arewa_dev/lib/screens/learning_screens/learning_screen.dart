import 'package:arewa_dev/constants/colors.dart';
import 'package:arewa_dev/models/chapter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key, required this.data});
  final ChapterModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(data.title!),
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                data.content!,
                style: GoogleFonts.montserrat(
                  color: AppColors.textPrimary,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 20),
              HighlightView(
                tabSize: 2,
                data.example.code,
                language: 'html', // Language for syntax highlighting
                theme: draculaTheme, // Choose your theme
                padding: EdgeInsets.all(15),
                textStyle: GoogleFonts.montserrat(fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}