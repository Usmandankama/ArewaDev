import 'package:arewa_dev/constants/colors.dart';
import 'package:arewa_dev/screens/community/community_page.dart';
import 'package:arewa_dev/screens/editor/offline_editor.dart';
import 'package:arewa_dev/screens/html/learn_html.dart';
import 'package:arewa_dev/screens/onboarding/onboarding.dart';
import 'package:arewa_dev/widgets/chapters.dart';
import 'package:arewa_dev/widgets/next_button.dart';
import 'package:arewa_dev/widgets/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white, size: 30.sp),
              onPressed: () {
                // Handle menu button press
              },
            ),
            CircleAvatar(
              radius: 20.sp,
              backgroundImage: AssetImage('assets/images/avatar1.jpeg'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ',
              style: GoogleFonts.playfairDisplay(
                color: AppColors.textPrimary,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Usman Dankama, ',
              style: GoogleFonts.playfairDisplay(
                color: AppColors.textPrimary,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50.h),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: .9,
                ),
                children: [
                  SectionContainer(
                    imagePath: 'assets/icons/html.png',
                    containerHeight: 120,
                    containerWidth: 150,
                    title: 'Web Development',
                    subtitle: 'Learn HTML',
                    sectionColor: AppColors.primaryColor,
                    nextScreen: ChapterListPage(),
                  ),
                  SectionContainer(
                    imagePath: 'assets/icons/timer.png',
                    containerHeight: 200,
                    containerWidth: 150,
                    title: 'Challenges & Quizzes',
                    subtitle:
                        'Test your skills with quick, interactive HTML & CSS challenges.',
                    sectionColor: AppColors.accentPurple,
                    nextScreen: OnboardingScreen(),
                  ),
                  SectionContainer(
                    imagePath: 'assets/icons/css.png',
                    containerHeight: 200,
                    containerWidth: 150,
                    title: 'Join the Community',
                    subtitle: 'Learn and grow with others.',
                    sectionColor: AppColors.accentBlue,
                    nextScreen: CommunityPage(),
                  ),

                  SectionContainer(
                    imagePath: 'assets/icons/projects.png',
                    containerHeight: 120,
                    containerWidth: 150,
                    title: 'Code Editor',
                    subtitle:
                        'Write and run your HTML code directly in the app.',
                    sectionColor: AppColors.secondaryColor,
                    nextScreen: HtmlEditorPage(),
                  ),
                ],
                // Row(
                //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [

                //   ],
                // ),

                //   SizedBox(height: 10.h),
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [

                //     ],
                //   ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
