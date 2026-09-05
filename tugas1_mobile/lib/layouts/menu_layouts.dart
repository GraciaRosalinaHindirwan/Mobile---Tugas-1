import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class MenuLayout extends StatelessWidget {
  final Widget content;
  final String title;
  const MenuLayout({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        "assets/icons/back.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 24,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
