import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/menu_card.dart';
import 'package:tugas1_mobile/page/summaryPage.dart';
import 'package:tugas1_mobile/page/third_menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MenuCard(
                title: "Penjumlahan & Pengurangan",
                icon: "assets/icons/tambahKurang.png",
                page: const summaryPage(),
              ),

              const SizedBox(height: 16),

              MenuCard(
                title: "Ganjil & Genap",
                icon: "assets/icons/ganjilGenap.png",
                page: const OddEvenPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}