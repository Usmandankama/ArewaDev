import 'package:arewa_dev/constants/colors.dart';
import 'package:arewa_dev/widgets/community_buttons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Join the Community'),
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.textPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Connect with other learners and developers!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            CommunityButton(
              buttonColor: AppColors.secondaryColor,
              buttonText: 'Join our Whatsapp Community',
              imagePath: 'assets/icons/whatsapp.png',
              onPressed:
                  () => _launchUrl('https://chat.whatsapp.com/FjXbUomHmNRKkuKHb5CZDn'),
            ),
            CommunityButton(
              buttonColor: AppColors.secondaryColor,
              buttonText: 'Join our Tiktok ',
              imagePath: 'assets/icons/tt.png',
              onPressed:
                  () => _launchUrl('https://discord.gg/your-server-link'),
            ),
            CommunityButton(
              buttonColor: AppColors.secondaryColor,
              buttonText: 'Join our Telegram Channel',
              imagePath: 'assets/icons/telegram.png',
              onPressed:
                  () => _launchUrl('https://discord.gg/your-server-link'),
            ),
          ],
        ),
      ),
    );
  }
}
