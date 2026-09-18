import 'package:flutter/material.dart';
import 'package:hijri_date/hijri.dart';
import 'package:tugas1_mobile/layouts/menu_layouts.dart';
import 'package:tugas1_mobile/components/date_input_card.dart';
import 'package:tugas1_mobile/components/output_card.dart';

class Hijriyah extends StatefulWidget {
  const Hijriyah({super.key});

  @override
  State<Hijriyah> createState() => _HijriyahState();
}

class _HijriyahState extends State<Hijriyah> {
  DateTime? selectedDate;
  String hasilHijriyah = '';

  //pilih tanggal di kalender masehi disini
  Future<void> pilihTanggal() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    //kalau user memilih tanggal, maka tanggal tersebut akan dikonversi ke kalender hijriyah
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        hasilHijriyah = konversiHijriyah(pickedDate);
      });
    }
  }

  //fungsi untuk mengkonversi tanggal masehi ke kalender hijriyah
  String konversiHijriyah(DateTime tanggal) {
    final hijri = HijriDate.fromDate(tanggal);

    //mengembalikan hasil konversi dalam format "tanggal bulan tahun H"
    return '${hijri.hDay} ${hijri.getLongMonthName()} ${hijri.hYear} H';
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Kalender Hijriyah",
      icon: 'assets/icons/hijriyah.png',
      description: 'Pilih tanggal untuk mengetahui tanggal Hijriyah.',
      content: Column(
        spacing: 24,
        children: [
          DateInputCard(
            label: "Masukkan Tanggal",
            hint: "Pilih tanggal",
            selectedDate: selectedDate,
            onTap: pilihTanggal,
          ),

          OutputCardComponent(
            question: "Tanggal Hijriyah",
            answer: hasilHijriyah,
          ),
        ],
      ),
    );
  }
}