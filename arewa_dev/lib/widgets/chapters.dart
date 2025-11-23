import 'dart:convert';
import 'package:arewa_dev/constants/colors.dart';
import 'package:arewa_dev/models/chapter_model.dart';
import 'package:arewa_dev/screens/learning_screens/learning_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterListPage extends StatefulWidget {
  const ChapterListPage({Key? key}) : super(key: key);

  @override
  State<ChapterListPage> createState() => _ChapterListPageState();
}

class _ChapterListPageState extends State<ChapterListPage> {
  late Future<List<ChapterModel>> _chaptersFuture;
  bool isHausa = false; // Toggle for Hausa language

  @override
  void initState() {
    super.initState();
    _chaptersFuture = _loadChapters();
  }

  Future<List<ChapterModel>> _loadChapters() async {
    final String response = await rootBundle.loadString(
      isHausa
          ? 'assets/data/html_tutorial_ha.json'
          : 'assets/data/html_tutorial_en.json',
    );
    final Map<String, dynamic> data = jsonDecode(response);
    final List<dynamic> chaptersJson = data['chapters'];
    return chaptersJson.map((json) => ChapterModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        foregroundColor: AppColors.textPrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Chapters',
              style: GoogleFonts.montserrat(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isHausa = !isHausa; // Toggle language
                  _chaptersFuture = _loadChapters(); // Reload chapters
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isHausa ? "EN" : "HA",
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: FutureBuilder<List<ChapterModel>>(
        future: _chaptersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final chapters = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];

              return GestureDetector(
                onTap: () {
                  if (chapter.unlocked) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                LearningScreen(chapter: chapters[index]),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("This chapter is locked")),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 14.h),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color:
                        chapter.unlocked
                            ? AppColors.secondaryColor
                            : Colors.grey[400],
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Circle with Chapter Number
                      CircleAvatar(
                        backgroundColor:
                            chapter.unlocked
                                ? AppColors.primaryColor
                                : Colors.grey,
                        radius: 22.r,
                        child: Text(
                          '${chapter.id}',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),

                      // Title
                      Expanded(
                        child: Text(
                          chapter.title,
                          style: GoogleFonts.montserrat(
                            color: AppColors.textPrimary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      // Lock or Arrow
                      Icon(
                        chapter.unlocked ? Icons.arrow_forward_ios : Icons.lock,
                        color: AppColors.textPrimary,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}