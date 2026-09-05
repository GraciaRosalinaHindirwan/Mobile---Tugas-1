import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/components/output_card.dart';
import 'package:tugas1_mobile/layouts/menu_layouts.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class FirstMenuPage extends StatefulWidget {
  const FirstMenuPage({super.key});

  @override
  State<FirstMenuPage> createState() => _FirstMenuPageState();
}

class _FirstMenuPageState extends State<FirstMenuPage> {
  final angka1Controller = TextEditingController();
  final angka2Controller = TextEditingController();

  String hasil = '0';

  @override
  void dispose() {
    angka1Controller.dispose();
    angka2Controller.dispose();
    super.dispose();
  }

  void hitungPenjumlahan() {
    final angka1 = double.tryParse(angka1Controller.text);
    final angka2 = double.tryParse(angka2Controller.text);

    if (angka1 == null || angka2 == null) {
      setState(() {
        hasil = 'Input tidak valid';
      });
      return;
    }

    final result = angka1 + angka2;

    setState(() {
      hasil = result == result.truncateToDouble()
          ? result.toInt().toString()
          : result.toString();
    });
  }

  void hitungPengurangan() {
    final angka1 = double.tryParse(angka1Controller.text);
    final angka2 = double.tryParse(angka2Controller.text);

    if (angka1 == null || angka2 == null) {
      setState(() {
        hasil = 'Input tidak valid';
      });
      return;
    }

    final result = angka1 - angka2;

    setState(() {
      hasil = result == result.truncateToDouble()
          ? result.toInt().toString()
          : result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: 'Penjumlahan & Pengurangan',
      icon: 'assets/icons/bigTambahKurang.png',
      description:
          'Masukkan dua angka, lalu pilih operasi penjumlahan atau pengurangan.',
      content: Column(
        children: [
          const SizedBox(height: 20),

          InputCardComponent(
            label: 'Masukkan Angka Pertama',
            hint: 'Contoh: 10',
            controller: angka1Controller,
          ),

          const SizedBox(height: 16),

          InputCardComponent(
            label: 'Masukkan Angka Kedua',
            hint: 'Contoh: 5',
            controller: angka2Controller,
          ),

          const SizedBox(height: 16),

          Row(
            spacing: 16,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: hitungPenjumlahan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    foregroundColor: AppColors.primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    '+ Penjumlahan',
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: ElevatedButton(
                  onPressed: hitungPengurangan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    foregroundColor: AppColors.primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    '− Pengurangan',
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          OutputCardComponent(
            question: 'Hasil Perhitungan',
            answer: hasil,
          ),
        ],
      ),
    );
  }
}