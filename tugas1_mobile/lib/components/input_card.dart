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
<<<<<<< HEAD
          keyboardType: TextInputType.number,
=======
          style: AppTextStyles.jostRegular.copyWith(
            fontSize: 14,
            color: AppColors.secondaryColor,
          ),
>>>>>>> d1573f0b70442d0e65d8779c7e3c361e4d0f6cf9
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
<<<<<<< HEAD
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
=======
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
>>>>>>> d1573f0b70442d0e65d8779c7e3c361e4d0f6cf9
              ),
            ),

            // Border ketika sedang dipilih
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
<<<<<<< HEAD
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
=======
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
>>>>>>> d1573f0b70442d0e65d8779c7e3c361e4d0f6cf9
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
