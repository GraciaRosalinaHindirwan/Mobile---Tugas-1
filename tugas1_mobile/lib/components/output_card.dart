import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class OutputCardComponent extends StatelessWidget {
  final String question;
  final String answer;

  const OutputCardComponent({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppColors.secondaryColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(
            color: AppColors.textColor,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Judul output
              Text(
                question,
                style: AppTextStyles.jostRegular.copyWith(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 4),

              // Hasil output
              Text(
                answer,
                style: AppTextStyles.jostRegular.copyWith(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}