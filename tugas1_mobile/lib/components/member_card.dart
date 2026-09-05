import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16), 
      ),
      child: Padding(padding: const EdgeInsets.all(24), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome!", 
            style: AppTextStyles.poppinsBold.copyWith(
              fontSize: 24, 
              color: AppColors.textColor, 
            ),
          ),
          Text("Nama Kelompok", style: AppTextStyles.jostRegular.copyWith(
            fontSize: 20, 
            color: AppColors.textColor, 
          ),),

          // anggota 
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1. Cinta Lamirna Siregar (124240011)", style: AppTextStyles.jostRegular.copyWith(fontSize: 16, color:AppColors.textColor),), 
                    Text("2. Fadiyah Choirunnisa Tsakif (124240041)",style: AppTextStyles.jostRegular.copyWith(fontSize: 16, color:AppColors.textColor)),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("3. Dighea Gumaisa (124240050)", style: AppTextStyles.jostRegular.copyWith(fontSize: 16, color:AppColors.textColor),), 
                    Text("4. Gracia Rosalina Hindirwan (124240080)", style: AppTextStyles.jostRegular.copyWith(fontSize: 16, color:AppColors.textColor),),
                  ],
                ),
              ),
            ],
          ),  
        ],
      ),
      ),
    );
  }
}