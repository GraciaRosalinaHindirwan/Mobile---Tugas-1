import 'package:flutter/material.dart';
import 'package:tugas1_mobile/layouts/dashboard_layouts.dart';
import 'package:tugas1_mobile/components/menu_card.dart';
import 'package:tugas1_mobile/page/hijriyah.dart';
import 'package:tugas1_mobile/page/profil%20page/profil.dart';
import 'package:tugas1_mobile/page/summaryPage.dart';
import 'package:tugas1_mobile/page/first_menu.dart';
import 'package:tugas1_mobile/page/second_menu.dart';
import 'package:tugas1_mobile/page/third_menu.dart';
import 'package:tugas1_mobile/page/weton.dart';
import 'package:tugas1_mobile/components/member_card.dart';
import 'package:tugas1_mobile/components/bottom_nav.dart';
import 'package:tugas1_mobile/page/stopwatch_menu.dart';
import 'package:tugas1_mobile/page/age_calculator.dart';
import 'package:tugas1_mobile/page/saka_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF013E37),

      body: IndexedStack(
        index: currentIndex,

        children: [
          DashboardLayout(
            welcomeCard: Container(child: const WelcomeCard()),
            menuLabel: "Menu",
            content: GridView.count(
              crossAxisCount: 2, //gridnya 2x2
              childAspectRatio: 2, //nentuin perbandingan lebar dan tinggi card
              crossAxisSpacing: 24, //jarak antar card kiri kanan
              mainAxisSpacing: 24, //jarak antar card atas bawah
              shrinkWrap: true, //tingginya sesuai dengan yang dibutuhkan
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MenuCard(
                  title: "Jumlah & Kurang",
                  icon: "assets/icons/tambahKurang.png",
                  page: const FirstMenuPage(),
                ),
                MenuCard(
                  title: "Kali & Bagi",
                  icon: "assets/icons/kaliBagi.png",
                  page: const SecondMenuPage(),
                ),
                MenuCard(
                  title: "Input Ganjil & Genap",
                  icon: "assets/icons/ganjilGenap.png",
                  page: const OddEvenPage(),
                ),
                MenuCard(
                  title: "Total Field Angka",
                  icon: "assets/icons/sum.png",
                  page: const summaryPage(),
                ),
                MenuCard(
                  title: "Konversi Weton",
                  icon: "assets/icons/weton_small.png",
                  page: const Weton(),
                ),
                MenuCard(
                  title: "Kalender Hijriyah",
                  icon: "assets/icons/hijri_smal.png",
                  page: const Hijriyah(),
                ),
                 MenuCard(
                  title: "Kalender Saka",
                  icon: "assets/icons/saka_small.png",
                  page: const Hijriyah(),
                ),
                MenuCard(
                  title: "Tanggal ke Umur",
                  icon: "assets/icons/age_kecil.png",
                  page: const AgeCalculatorPage(),
                ),
              ],
            ),
          ),
          const StopwatchMenuPage(),
          const Profil(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
