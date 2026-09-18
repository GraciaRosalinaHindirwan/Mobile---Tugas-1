import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class DateInputCard extends StatelessWidget {
  final String label; 
  final String hint; 
  final DateTime? selectedDate; 
  final VoidCallback onTap; 

  const DateInputCard({
    super.key,
    required this.label, 
    required this.hint,
    required this.selectedDate,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.poppinsBold.copyWith(
            fontSize: 16,
            color: AppColors.secondaryColor, 
          ),
        ), 

        const SizedBox(height: 8), 

        GestureDetector(
          onTap: onTap, 
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12, 
            ),

            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.secondaryColor, 
              ), 
              borderRadius: BorderRadius.circular(24), 
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null ? hint : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                  style: AppTextStyles.jostRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.secondaryColor, 
                  ),
                ), 

                const Icon(Icons.calendar_month), 
              ],
            ),
          ),
        )
      ],

    );
  }
}