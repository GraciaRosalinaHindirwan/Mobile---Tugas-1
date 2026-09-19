import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/profil_menu_card.dart';
import 'package:tugas1_mobile/page/faq.dart';
import 'package:tugas1_mobile/page/profil%20page/account.dart';
import 'package:tugas1_mobile/page/profil%20page/editPassword.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "Profil",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsBold.copyWith(
                    fontSize: 32, 
                    color: AppColors.secondaryColor,
                    ),
                  ),

                  Image.asset(
                    "assets/icons/edit.png",
                    width: 30,
                    height: 30,
                  )
                ],
              ),

              Column(
                children: [
                  Padding(padding: const EdgeInsetsGeometry.all(8)),
                  Image.asset("assets/icons/profil.png",
                  width: 100,
                  height: 100,), 
                  Text(
                    "Binturong",
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 24, 
                      color: AppColors.secondaryColor, 
                    ),
                  ), 
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsetsGeometry.all(4)),
                  Text(
                    "Account Details",
                    textAlign: TextAlign.left,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 16, 
                      color: AppColors.secondaryColor, 
                    ),  
                  ),

                  Divider(color: AppColors.secondaryColor,), 
                ],
              ),

              ProfilMenuCard(title: "Account", iconPath: "assets/icons/account.png", page: Account(), ),
              ProfilMenuCard(title: "Password", iconPath: "assets/icons/password.png", page: Editpassword(),), 

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsetsGeometry.all(4)),
                  Text(
                    "General",
                    textAlign: TextAlign.left,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 16, 
                      color: AppColors.secondaryColor, 
                    ),  
                  ),

                  Divider(color: AppColors.secondaryColor,), 
                ],
              ),

                ProfilMenuCard(title: "FAQ", iconPath: "assets/icons/FAQ.png", page: BantuanPage()), 
            ],
          ),
        ),

      ),
    );
  }
}