import 'package:flutter/material.dart';

import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITLE
            Center(
              child: Text(
                'Frequently Asked Questions',
                textAlign: TextAlign.center,
                style: AppTextStyles.poppinsBold.copyWith(
                  fontSize: 25,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Text(
                'Bantuan & Panduan Aplikasi',
                textAlign: TextAlign.center,
                style: AppTextStyles.jostRegular.copyWith(
                  fontSize: 12,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),

            const SizedBox(height: 30),
            // FAQ
            _faqCard(
              question: 'Bagaimana cara menggunakan aplikasi?',
              answer:
                  'Login terlebih dahulu menggunakan username '
                  'dan password. Setelah berhasil login, kamu '
                  'akan diarahkan ke halaman Dashboard. Pilih '
                  'menu yang ingin digunakan dan ikuti instruksi '
                  'yang tersedia.',
            ),

            const SizedBox(height: 12),

            _faqCard(
              question: 'Apa saja menu yang tersedia?',
              answer:
                  'Aplikasi menyediakan beberapa menu, yaitu '
                  'Penjumlahan & Pengurangan, Perkalian & '
                  'Pembagian, Ganjil & Genap, Total Field Angka, '
                  'Konversi Weton, dan Kalender Hijriyah.',
            ),

            const SizedBox(height: 12),

            _faqCard(
              question: 'Bagaimana cara menggunakan menu perhitungan?',
              answer:
                  'Pilih menu perhitungan pada Dashboard, '
                  'masukkan angka yang diperlukan pada kolom '
                  'input, kemudian tekan tombol proses untuk '
                  'melihat hasil perhitungan.',
            ),

            const SizedBox(height: 12),

            _faqCard(
              question: 'Bagaimana cara menggunakan Stopwatch?',
              answer:
                  'Pilih menu Stopwatch melalui Bottom Navigation. '
                  'Tekan tombol Start untuk memulai stopwatch, '
                  'Stop untuk menghentikan sementara, dan Reset '
                  'untuk mengembalikan waktu ke 00:00:00.',
            ),

            const SizedBox(height: 12),

            _faqCard(
              question: 'Bagaimana cara menggunakan Kalender?',
              answer:
                  'Pilih menu Weton atau Kalender Hijriyah pada '
                  'Dashboard. Kemudian pilih tanggal yang ingin '
                  'diperiksa untuk mendapatkan hasil konversinya.',
            ),

            const SizedBox(height: 30),
            // LOGOUT SECTION
            Text(
              'Account',
              style: AppTextStyles.jostBold.copyWith(
                fontSize: 14,
                color: AppColors.secondaryColor,
              ),
            ),

            const SizedBox(height: 5),

            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.secondaryColor,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // FAQ CARD
  Widget _faqCard({required String question, required String answer}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),

        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),

          iconColor: AppColors.secondaryColor,
          collapsedIconColor: AppColors.secondaryColor,

          title: Text(
            question,
            style: AppTextStyles.jostBold.copyWith(
              fontSize: 14,
              color: AppColors.primaryColor,
            ),
          ),

          trailing: Container(
            width: 30,
            height: 30,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),

            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: AppColors.secondaryColor,
            ),
          ),

          children: [
            Align(
              alignment: Alignment.centerLeft,

              child: Text(
                answer,
                style: AppTextStyles.jostRegular.copyWith(
                  fontSize: 12,
                  height: 1.5,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
