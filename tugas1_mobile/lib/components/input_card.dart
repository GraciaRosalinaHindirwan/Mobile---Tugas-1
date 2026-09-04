import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class InputCardComponent extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const InputCardComponent({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Label input
        Text(
          label,
          style: AppTextStyles.poppinsBold.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor,
          ),
        ),

        const SizedBox(height: 8),

        // Kolom input
        TextField(
          controller: controller,
          style: AppTextStyles.jostRegular.copyWith(
            fontSize: 14,
            color: AppColors.secondaryColor,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.jostRegular.copyWith(
              fontSize: 13,
              color: AppColors.secondaryColor,
            ),

            // Tidak ada background
            filled: false,

            // Border ketika tidak dipilih
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),

            // Border ketika sedang dipilih
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
                width: 2,
              ),
            ),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }
}
