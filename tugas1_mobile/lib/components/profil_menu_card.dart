import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class ProfilMenuCard extends StatelessWidget {
  final String title; 
  final String iconPath; 
  final Widget page;  

  const ProfilMenuCard({
    super.key,
    required this.title,
    required this.iconPath, 
    required this.page, 
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor, 
          borderRadius: BorderRadius.circular(16), 
        ),
      
        child: Row(
          children: [
            Image.asset(iconPath,
            width: 30,
            height: 30,), 
      
            const SizedBox(width: 16,), 
      
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.poppinsBold.copyWith(
                  fontSize: 20, 
                  color: AppColors.primaryColor, 
                ),
              ),
      
            ),
            Icon(
              Icons.chevron_right,
              size: 36,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}