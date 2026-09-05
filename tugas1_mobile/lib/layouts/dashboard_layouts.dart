import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class DashboardLayout extends StatelessWidget {
  final Widget welcomeCard;
  final String menuLabel;
  final Widget content;

  const DashboardLayout({
    super.key,
    required this.welcomeCard,
    required this.menuLabel,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeCard,
              const SizedBox(height: 10),
              Text(
                menuLabel,
                style: AppTextStyles.poppinsBold.copyWith(
                  fontSize: 20,
                  color: AppColors.secondaryColor,
                ),
              ),
              const SizedBox(height: 10),
              content,
            ],
          ),
        ),
      ),
    );
  }
}