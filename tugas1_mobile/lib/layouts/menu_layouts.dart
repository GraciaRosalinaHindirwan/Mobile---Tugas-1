import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart'; 
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class MenuLayout extends StatelessWidget {
  final String title; 
  final String icon;
  final String description; 
  final Widget content; 

  const MenuLayout({super.key,
  required this.title,
  required this.icon,
  required this.description,
  required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding:const EdgeInsets.all(32), 
        // color: AppColors.primaryColor,
        child: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/icons/back.png', 
                    width: 30, 
                    height: 30,
                  ), 
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 20,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),

            // deskripsi singkat
            Column(
              spacing: 24, 
              children: [
                Image.asset(icon, 
                width: 100, 
                height: 100,),

                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.jostRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.secondaryColor,
                  )
                ), 
              ],
            ),

            content, 
          ],
        ),
        )
      ),
    ); 
  }
}