import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/result_card.dart';
import 'package:tugas1_mobile/components/button_submit.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

DateTime getNyepi(int year) {
  Map<int, DateTime> dataNyepi = {
    2020: DateTime(2020, 3, 25),
    2021: DateTime(2021, 3, 14),
    2022: DateTime(2022, 3, 3),
    2023: DateTime(2023, 3, 22),
    2024: DateTime(2024, 3, 11),
    2025: DateTime(2025, 3, 29),
    2026: DateTime(2026, 3, 19),
    2027: DateTime(2027, 3, 8),
    2028: DateTime(2028, 3, 26),
  };

  return dataNyepi[year] ?? DateTime(year, 3, 21); // fallback
}

String masehiKeSakaBali(DateTime masehi) {
  int year = masehi.year;

  int sakaYear = year - 78;

  DateTime startSaka = getNyepi(year);

  if (masehi.isBefore(startSaka)) {
    sakaYear -= 1;
    startSaka = getNyepi(year - 1);
  }

  int selisihHari = masehi.difference(startSaka).inDays;

  List<String> sasih = [
    "Kasa",
    "Karo",
    "Katelu",
    "Kapat",
    "Kalima",
    "Kanem",
    "Kepitu",
    "Kewulu",
    "Kasanga",
    "Kedasa",
    "Desta",
    "Kesada"
  ];

  List<int> hariBulan = [
    30, 29, 30, 29, 30, 29, 30, 29, 30, 29, 30, 29
  ];

  int bulan = 0;
  int hari = selisihHari;

  for (int i = 0; i < hariBulan.length; i++) {
    if (hari < hariBulan[i]) {
      bulan = i;
      break;
    } else {
      hari -= hariBulan[i];
    }
  }

  int tanggal = hari + 1;

  String fase;
  int nomor;

  if (tanggal <= 15) {
    fase = "Penanggal";
    nomor = tanggal;
  } else {
    fase = "Panglong";
    nomor = tanggal - 15;
  }

  return "$fase $nomor ${sasih[bulan]} $sakaYear";
}

class SakaMenuPage extends StatefulWidget {
  const SakaMenuPage({super.key});

  @override
  State<SakaMenuPage> createState() => _SakaMenuPageState();
}

class _SakaMenuPageState extends State<SakaMenuPage> {
  DateTime? _selectedDate;

  String? get saka {
    if (_selectedDate == null) return null;
    return masehiKeSakaBali(_selectedDate!);
  }

  Future<void> pilihTanggal(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF013E37),
      body: Container(
        padding: const EdgeInsets.all(32),
        color: AppColors.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/back.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Menu Tanggal Saka',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.poppinsBold.copyWith(
                        fontSize: 20,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              // deskripsi singkat
              Column(
                spacing: 24,
                children: [
                  Image.asset(
                  'assets/icons/saka.png',
                  width: 100,
                  height: 100,
                  ),
                  Text(
                    'Pilih tanggal Masehi untuk mengetahui tanggal Saka Bali-nya.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.jostRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),

              // button pilih tanggal
              ButtonSubmit(
                label: "Pilih Tanggal",
                onPressed: () => pilihTanggal(context),
              ),

              // card hasil konversi
              ResultCard(
                title: "Tanggal Saka",
                result: saka == null
                    ? "Silahkan pilih tanggal dulu"
                    : "Tanggal: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}\n$saka",
              ),
            ],
          ),
        ),
      ),
    );
  }
}