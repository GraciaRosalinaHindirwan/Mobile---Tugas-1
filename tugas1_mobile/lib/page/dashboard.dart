import 'package:flutter/material.dart';
import 'package:tugas1_mobile/layouts/dashboard_layouts.dart';
import 'package:tugas1_mobile/components/menu_card.dart';
import 'package:tugas1_mobile/page/summaryPage.dart';
import 'package:tugas1_mobile/page/second_menu.dart';
import 'package:tugas1_mobile/page/third_menu.dart';
import 'package:tugas1_mobile/components/member_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      welcomeCard: Container(
        child: const WelcomeCard(),
      ),
      menuLabel: "Menu",
      content: GridView.count(
        crossAxisCount: 2, //gridnya 2x2
        childAspectRatio: 2.5, //nentuin perbandingan lebar dan tinggi card 
        crossAxisSpacing: 24, //jarak antar card kiri kanan
        mainAxisSpacing: 24, //jarak antar card atas bawah 
        shrinkWrap: true, //tingginya sesuai dengan yang dibutuhkan 
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MenuCard(title: "Penjumlahan & Pengurangan", icon: "assets/icons/tambahKurang.png", page: const summaryPage()),
          MenuCard(title: "Perkalian & Pembagian", icon: "assets/icons/kaliBagi.png", page: const SecondMenuPage()), 
          MenuCard(title: "Input Ganjil & Genap", icon: "assets/icons/ganjilGenap.png", page: const OddEvenPage()), 
          MenuCard(title: "Total Field Angka", icon: "assets/icons/sum.png", page: const summaryPage()), 
        ],

      ),
        
    );
  }
}