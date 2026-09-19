import 'package:flutter/material.dart';
import 'package:tugas1_mobile/page/profil%20page/editEmail.dart';
import 'package:tugas1_mobile/page/profil%20page/editNama.dart';
import 'package:tugas1_mobile/page/profil%20page/editPhone.dart';
import 'package:tugas1_mobile/page/profil%20page/editUsername.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class Account extends StatelessWidget {
  const Account({super.key});

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
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/back.png', 
                        width: 30, 
                        height: 30,
                      ), 
                    ),
                  ),
                  Text(
                    "Account",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsBold.copyWith(
                    fontSize: 32, 
                    color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),

              Image.asset("assets/icons/profil.png",width: 100, height: 100,), 

              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const Editnama(),
                  ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset("assets/icons/reduce-user.png", width: 50, height: 50,), 
                    SizedBox(width: 24,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama",
                        textAlign: TextAlign.left,
                          style: AppTextStyles.poppinsBold.copyWith(
                          fontSize: 16, 
                          color: AppColors.secondaryColor,
                          ),
                        ),
                
                        Text("Binturong",
                          textAlign: TextAlign.left,
                          style: AppTextStyles.poppinsRegular.copyWith(
                          fontSize: 16, 
                          color: AppColors.secondaryColor,
                          ),
                        ), 
                      ],
                
                    ),
                  ],
                ),
              ),

              
              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const Editusername(),
                  ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset("assets/icons/reduce-user.png", width: 50, height: 50,), 
                    SizedBox(width: 24,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama Pengguna",
                        textAlign: TextAlign.left,
                          style: AppTextStyles.poppinsBold.copyWith(
                          fontSize: 16, 
                          color: AppColors.secondaryColor,
                          ),
                        ),
                
                        Text("@Binturong",
                          textAlign: TextAlign.left,
                          style: AppTextStyles.poppinsRegular.copyWith(
                          fontSize: 16, 
                          color: AppColors.secondaryColor,
                          ),
                        ), 
                      ],
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const Editemail(),
                  ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset("assets/icons/email.png", width: 50, height: 50,), 
                    SizedBox(width: 24,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email",
                        textAlign: TextAlign.left,
                          style: AppTextStyles.poppinsBold.copyWith(
                          fontSize: 16, 
                          color: AppColors.secondaryColor,
                          ),
                        ),
                
                        Text("Binturong@gmail.com",
                          textAlign: TextAlign.left,
                          style: AppTextStyles.poppinsRegular.copyWith(
                          fontSize: 16, 
                          color: AppColors.secondaryColor,
                          ),
                        ), 
                      ],
                
                    ),
                  ],
                ),
              ),
              
              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const Editphone(),
                  ),
                  );
                },
                child: Row(
                  children: [
                    Image.asset("assets/icons/phone.png", width: 50, height: 50,), 
                    SizedBox(width: 24,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Telepon",
                        textAlign: TextAlign.left,
                          style: AppTextStyles.poppinsBold.copyWith(
                          fontSize: 16, 
                          color: AppColors.secondaryColor,
                          ),
                        ),
                
                        Text("0000-0000-0000",
                          textAlign: TextAlign.left,
                          style: AppTextStyles.poppinsRegular.copyWith(
                          fontSize: 16, 
                          color: AppColors.secondaryColor,
                          ),
                        ), 
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        )
      ),
      
    );
  }
}