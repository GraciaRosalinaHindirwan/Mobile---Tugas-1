import 'package:flutter/material.dart';
import 'package:tugas1_mobile/layouts/menu_layouts.dart';
import 'package:tugas1_mobile/components/date_input_card.dart';
import 'package:tugas1_mobile/components/output_card.dart';

class Weton extends StatefulWidget {
  const Weton({super.key});

  @override
  State<Weton> createState() => _WetonState();
}

class _WetonState extends State<Weton> {
  DateTime? selectedDate;
  String hasilWeton = '';  

// yah intinya biar nunggu user milih dulu 
  Future<void> pilihTanggal() async{
    final DateTime? pickedDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900),
      lastDate: DateTime.now()
      );

      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate; 
          hasilWeton = hitungWeton(pickedDate); 
        });
      }
  }

  String hitungHari(DateTime tanggal) {
  final List<String> hari = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  return hari[tanggal.weekday - 1];
}

String hitungPasaran(DateTime tanggal){
  final List<String> pasaran = [
    'Legi', 
    'Pahing',
    'Pon', 
    'Wage', 
    'Kliwon', 
  ]; 

  // tanggal patokan 
  DateTime patokan = DateTime(1945, 8, 17); 

  // hitung jarak hari dari tanggal patokan 
  final int selisihHari = tanggal.difference(patokan).inDays;  

  final int index = ((selisihHari % 5) + 5) % 5; 

  return pasaran[index]; 
}

String hitungWeton(DateTime tanggal){
  String hari = hitungHari(tanggal); 
  String pasaran = hitungPasaran(tanggal); 

  return '$hari $pasaran'; 
}

 

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Kalender Weton",
      icon: 'assets/icons/weton.png',
      description: 'Masukkan tanggal lahir untuk mengetahui weton kamu.',
      content: Column(
        spacing: 24,
        children: [
          DateInputCard(
            label: "Masukkan Tanggal Lahir", 
            hint: "pilih tanggal lahir ", 
            selectedDate: selectedDate, 
            onTap: pilihTanggal,
          ),

          OutputCardComponent(
            question: "Weton Kamu adalah", 
            answer: hasilWeton)
        ], 
      ),
    );  
  }
}