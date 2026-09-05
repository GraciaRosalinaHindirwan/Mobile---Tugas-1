import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/result_card.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/theme/app_colors.dart'; 
import 'package:tugas1_mobile/theme/app_text_styles.dart';
import 'package:tugas1_mobile/components/button_submit.dart';

class summaryPage extends StatefulWidget {
  const summaryPage({super.key});

  @override
  State<summaryPage> createState() => _summaryPageState();
}

class _summaryPageState extends State<summaryPage> {
  int totalNumbers = 0; 
  int totalSum = 0; 

  final TextEditingController controller = TextEditingController();
  
  List<int> getNumbers(String text){
    final regex = RegExp(r'\d+'); 

    // regex ini akan nyari satu/lebih dari pola angka. 

    return regex
    .allMatches(text) //mencari semua bagian yang cocok dengan pola regex 
    .map((match) => int.parse(match.group(0)!)) //mengubah string angka menjadi int 
    .toList(); 
  }

  int getTotal(List<int> numbers){
    return numbers.fold(
      0, //mulai dari angka 0 lihat listnya satu per satu 
      (sum, number) => sum + number); 
      // sum = jumlah sementara 
      // number = angka yang sedang di proses 
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container( 
        padding:const EdgeInsets.all(32), 
        color: AppColors.primaryColor,
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
            InputCardComponent(label: "Masukkan Angka", hint: " ", controller: controller,), 
            
            // button submit 
            ButtonSubmit(onPressed: () {
              final numbers = getNumbers(controller.text); 
              final total = getTotal(numbers); 

            // Supaya UI nya terupdate
              setState(() {
                totalNumbers = numbers.length; 
                totalSum = total; 
              });
            },),

            // card hasil perhitungan 
            ResultCard(title: "Total Angka", result: totalNumbers.toString()), 
            ResultCard(title: "Total Penjumlahan", result: totalSum.toString()),
          ],
        ),
      ), 
    ),
    );
  }
}