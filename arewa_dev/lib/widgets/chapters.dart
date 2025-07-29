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
  bool isHausa = true; // Toggle for Hausa language

  @override
  void initState() {
    super.initState();
    _chaptersFuture = _loadChapters();
  }

  Future<List<ChapterModel>> _loadChapters() async {
    final String response = await rootBundle.loadString(
      isHausa
          ? 'assets/data/html_tutorial_ha.json'
          :
      'assets/data/html_tutorial_en.json',
    );
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => ChapterModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Chapters',
              style: GoogleFonts.montserrat(
                color: AppColors.textPrimary,
                fontSize: 20.sp,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isHausa = !isHausa; // Toggle language
                  _chaptersFuture = _loadChapters(); // Reload chapters
                });
              },
              child: Text(
                isHausa?"HA": 'EN',
                style: GoogleFonts.montserrat(
                  color: AppColors.textPrimary,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.textPrimary,
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
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  color: AppColors.secondaryColor,
                  child: ListTile(
                    leading: Text(
                      '${chapter.id}',
                      style: GoogleFonts.montserrat(
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                      ),
                    ),
                    title: Text(
                      chapter.title!,
                      style: GoogleFonts.montserrat(
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  LearningScreen(data: chapters[index]),
                        ),
                      );
                    },
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
