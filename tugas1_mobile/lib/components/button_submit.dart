import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class ButtonSubmit extends StatelessWidget {
  final VoidCallback onPressed; 
  const ButtonSubmit({
    super.key, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          side: const BorderSide(
            color: AppColors.secondaryColor,
            width: 1, 
          ),
        ), 
        child: Text(
          'Jalankan',
          style: AppTextStyles.poppinsBold.copyWith(
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    ); 
  }
}