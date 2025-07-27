import 'package:arewa_dev/constants/colors.dart';
import 'package:arewa_dev/models/onboarding_page.dart';
import 'package:arewa_dev/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: '''Maraba da 
ArewaDev!''',
      description:
          'Ka shiga cikin sabon zamani na masu ilimin fasaha a Arewacin Najeriya. Ko ka fara ne ko kuma kana son sabunta iliminka — wannan app ɗin yana koya HTML da sauƙi, da Hausa..',
      imageAsset: 'assets/icons/flag.png',
    ),
    OnboardingPageModel(
      title: '''Yi aiki.
Koya.
Ci gaba.''',
      description:
          'ArewaDev ba karatu kaɗai ba ne za ka rika gina abubuwa da hannunka. Zamu koya tare da misalai masu sauƙi da bayani a Hausa.',
      imageAsset: 'assets/icons/workflow.png',
    ),
    OnboardingPageModel(
      title: '''Babu internet? 
Babu matsala.''',
      description:
          'Wannan app yana aiki ko ba tare da internet ba. Danna Fara Koyo don ka fara tafiyarka cikin duniyar web development..',
      imageAsset: 'assets/icons/offline.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == pages.length - 1);
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(page.imageAsset, height: 250.h),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.h),

                        child: Text(
                          page.title,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.playfairDisplay(
                            color: AppColors.textPrimary,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          page.description,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Bottom Container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: pages.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        if (isLastPage) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        isLastPage ? 'Get Started' : 'Next',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
