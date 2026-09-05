import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/components/output_card.dart';
import 'package:tugas1_mobile/layouts/menu_layouts.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';
import 'package:tugas1_mobile/components/button_submit.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  State<OddEvenPage> createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final controller = TextEditingController();

  String hasil = '0';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void cekBilangan() {
    final angka = int.tryParse(controller.text.trim());

    if (angka == null) {
      setState(() {
        hasil = 'Input tidak valid';
      });
      return;
    }

    setState(() {
      if (angka % 2 == 0) {
        hasil = '$angka adalah bilangan GENAP';
      } else {
        hasil = '$angka adalah bilangan GANJIL';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: 'Input Ganjil & Genap',

      content: Column(
        children: [
          // ICON
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.secondaryColor, width: 3),
            ),
            child: Center(
              child: Text(
                'Σ',
                style: AppTextStyles.jostBold.copyWith(
                  fontSize: 24,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          // DESKRIPSI
          Text(
            'Masukkan bilangan bulat, sistem akan menentukan '
            'bilangan tersebut termasuk bilangan ganjil atau '
            'bilangan genap.',
            textAlign: TextAlign.center,
            style: AppTextStyles.jostRegular.copyWith(
              fontSize: 11,
              color: AppColors.secondaryColor,
            ),
          ),

          const SizedBox(height: 20),
          // INPUT
          InputCardComponent(
            label: 'Masukkan Angka',
            hint: 'Masukkan bilangan',
            controller: controller,
          ),

          const SizedBox(height: 16),
          // BUTTON
          SizedBox(
            width: double.infinity,
            child: ButtonSubmit(
              onPressed: cekBilangan,
            ),
          ),
          const SizedBox(height: 16),
          // OUTPUT
          OutputCardComponent(question: 'Jawaban', answer: hasil),
        ],
      ),
    );
  }
}
