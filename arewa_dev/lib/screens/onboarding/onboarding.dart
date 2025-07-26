import 'package:arewa_dev/models/onboarding_page.dart';
import 'package:arewa_dev/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      children: <Widget>[
        const OnboardingPage(
          title: 'Maraba da ArewaDev!',
          description: 'Ka shiga cikin sabon zamani na masu ilimin fasaha a Arewacin Najeriya. Ko ka fara ne ko kuma kana son sabunta iliminka — wannan app ɗin yana koya HTML da sauƙi, da Hausa.',
          iconPath: 'assets/icons/flag.png',
        ),
        const OnboardingPage(
          title: 'Welcome to Arewa Dev 2',
          description: 'Your journey to mastering Flutter starts here.',
          iconPath: 'assets/icons/flag.png',
        ),
        OnboardingPage(
          title: 'Track Your Progress',
          description:
              'Monitor your learning journey with easy-to-use progress tracking tools.',
          iconPath: 'assets/icons/flag.png',
          isLastPage: true,
          onGetStarted: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ],
    );
  }
}
