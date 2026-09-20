import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class EditpageLayouts extends StatelessWidget {
  final String title;
  final Widget content; 

  const EditpageLayouts({
    super.key,
    required this.title, 
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/back.png', 
                        width: 30, 
                        height: 30,
                      ), 
                    ),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsBold.copyWith(
                    fontSize: 32, 
                    color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),

              content, 
            ],
          ),
        ),
      ),
    );
  }
}