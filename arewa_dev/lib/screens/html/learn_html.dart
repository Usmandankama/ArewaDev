// import 'dart:convert';

// import 'package:arewa_dev/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:arewa_dev/models/html_lessons.dart'; // your model file

// class LearnHtml extends StatefulWidget {
//   const LearnHtml({super.key});

//   @override
//   State<LearnHtml> createState() => _LearnHtmlState();
// }

// class _LearnHtmlState extends State<LearnHtml> {
//   late Future<List<Lesson>> _lessonsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _lessonsFuture = loadLessons();
//   }

//   Future<List<Lesson>> loadLessons() async {
//     final String response = await rootBundle.loadString('assets/data/html_tutorial_ha.json');
//     final data = jsonDecode(response);
//     HtmlChapter chapter = HtmlChapter.fromJson(data);
//     return chapter.lessons;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         foregroundColor: AppColors.textPrimary,
//         title: Text(
//           'Learn HTML',
//           style: TextStyle(color: AppColors.textPrimary, fontSize: 20.sp),
//         ),
//         backgroundColor: AppColors.backgroundColor,
//       ),
//       body: FutureBuilder<List<Lesson>>(
//         future: _lessonsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error loading lessons: ${snapshot.error}'));
//           }

//           final lessons = snapshot.data!;

//           return ListView.builder(
//             padding: const EdgeInsets.all(10.0),
//             itemCount: lessons.length,
//             itemBuilder: (context, index) {
//               final lesson = lessons[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Card(
//                   color: AppColors.secondaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.sp),
//                   ),
//                   elevation: 2,
//                   child: ListTile(
//                     title: Text(
//                       lesson.displayTitle,
//                       style: TextStyle(
//                         color: AppColors.textPrimary,
//                         fontSize: 18.sp,
//                       ),
//                     ),
//                     onTap: () {
//                       // Navigate to detailed view, pass `lesson`
//                       // Navigator.push(context, MaterialPageRoute(
//                       //   builder: (_) => LessonDetailPage(lesson: lesson),
//                       // ));
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
