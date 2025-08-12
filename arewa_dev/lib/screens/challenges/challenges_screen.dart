import 'package:arewa_dev/constants/colors.dart';
import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Challenges'),
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.textPrimary,
      ),
    );
  }
}
