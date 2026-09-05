import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/result_card.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';
import 'package:tugas1_mobile/components/button_submit.dart';

class SecondMenuPage extends StatefulWidget {
  const SecondMenuPage({super.key});

  @override
  State<SecondMenuPage> createState() => _SecondMenuPageState();
}

class _SecondMenuPageState extends State<SecondMenuPage> {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  String hasil = "";

  @override
  void dispose() {
    angka1Controller.dispose();
    angka2Controller.dispose();
    super.dispose();
  }

  void hitungPerkalian() {
    try {
      double a = double.parse(angka1Controller.text);
      double b = double.parse(angka2Controller.text);

      double result = a * b;

      setState(() {
        hasil = result.toString();
      });
    } catch (e) {
      setState(() {
        hasil = "Input tidak valid";
      });
    }
  }

  void hitungPembagian() {
    try {
      double a = double.parse(angka1Controller.text);
      double b = double.parse(angka2Controller.text);

      if (b == 0) {
        setState(() {
          hasil = "Tidak bisa dibagi dengan 0";
        });
        return;
      }

      double result = a / b;

      setState(() {
        hasil = result.toString();
      });
    } catch (e) {
      setState(() {
        hasil = "Input tidak valid";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
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
                      height: 30,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Perkalian & Pembagian',
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
                  Image.asset(
                    'assets/icons/kaliBagi.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    'Masukkan dua angka, lalu pilih operasi perkalian atau pembagian.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.jostRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),

              // field input
              InputCardComponent(
                label: "Masukkan angka pertama",
                hint: "Contoh: 10",
                controller: angka1Controller,
              ),

              InputCardComponent(
                label: "Masukkan angka kedua",
                hint: "Contoh: 2",
                controller: angka2Controller,
              ),

              // button submit
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: ButtonSubmit(
                      onPressed: hitungPerkalian,
                    ),
                  ),
                  Expanded(
                    child: ButtonSubmit(
                      onPressed: hitungPembagian,
                    ),
                  ),
                ],
              ),

              // card hasil perhitungan
              ResultCard(
                title: "Hasil Perhitungan",
                result: hasil,
              ),
            ],
          ),
        ),
      ),
    );
  }
}