import 'package:flutter/material.dart';
import 'components/menu_card.dart';
import 'page/summaryPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MenuCard(title: "Penjumlahan & Pengurangan", 
        icon: "assets/icons/tambahKurang.png", 
        page: const summaryPage(),)
      ),
    );
  }
}
