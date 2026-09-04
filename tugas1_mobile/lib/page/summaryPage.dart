import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/result_card.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/theme/app_colors.dart'; 
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class summaryPage extends StatelessWidget {
  const summaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        padding:const EdgeInsets.all(32), 
        color: AppColors.primaryColor,
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
                    height: 30,), 
                ),
                 Expanded(
                  child: Text(
                    'Total Field Angka',
                    textAlign: TextAlign.center, 
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 20, 
                      color: AppColors.secondaryColor,
                    ) 
                  ),
                 ),
              ],
            ),

            // deskripsi singkat
            Column(
              spacing: 24, 
              children: [
                Image.asset('assets/icons/Bigsum.png', 
                width: 100, 
                height: 100,),

                Text(
                  'Masukkan teks yang dapat berisi huruf dan angka. Sistem akan mendeteksi angka yang terdapat dalam teks.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.jostRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.secondaryColor,
                  )
                ), 
              ],
            ),

            // field input
            InputCardComponent(label: "Masukkan Angka", hint: " ", controller: TextEditingController(),), 
            

            // card hasil perhitungan 
            ResultCard(title: "Total Angka", result: "0"), 
            ResultCard(title: "Total Penjumlahan", result: "0"),
          ],
        ),
      ), 
    );
  }
}