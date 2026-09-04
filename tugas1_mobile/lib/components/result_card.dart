import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class ResultCard extends StatelessWidget {
  final String title; 
  final String result; 

  const ResultCard({
    super.key, 
    required this.title, 
    required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondaryColor, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8), 
        child:
        Column(
          children: [
            Text(this.title,
            textAlign: TextAlign.center, 
            style: AppTextStyles.jostRegular.copyWith(
              fontSize: 20, 
              color: AppColors.textColor,
            )), 
            Text(this.result, 
            textAlign: TextAlign.center,
            style: AppTextStyles.jostBold.copyWith(
              fontSize: 20, 
              color: AppColors.textColor,
            )), 
          ],
        ),
      )
    );
  }
}