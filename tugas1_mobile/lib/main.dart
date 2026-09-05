import 'package:flutter/material.dart';
import 'package:tugas1_mobile/page/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: const LoginPage(),
=======
      home: Scaffold(
        body: MenuCard(title: "Penjumlahan & Pengurangan", 
        icon: "assets/icons/tambahKurang.png", 
        page: const summaryPage(),)
      ),
>>>>>>> 25a28f4dcc01bcac9125a75e2b70647fb396b364
    );
  }
}