import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class AgeCalculatorPage extends StatefulWidget {
  const AgeCalculatorPage({super.key});

  @override
  State<AgeCalculatorPage> createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {
  DateTime? _birthDate;

  int _years = 0;
  int _months = 0;
  int _days = 0;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _calculateAge() {
    if (_birthDate == null) return;

    final now = DateTime.now();
    final birth = _birthDate!;

    int years = now.year - birth.year;
    int months = now.month - birth.month;
    int days = now.day - birth.day;

    if (days < 0) {
      months--;

      final previousMonth = DateTime(
        now.year,
        now.month,
        0,
      );

      days += previousMonth.day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    final birthdayThisYear = DateTime(
      now.year,
      birth.month,
      birth.day,
      birth.hour,
      birth.minute,
      birth.second,
    );

    DateTime baseDate;

    if (now.isBefore(birthdayThisYear)) {
      baseDate = DateTime(
        now.year - 1,
        birth.month,
        birth.day,
        birth.hour,
        birth.minute,
        birth.second,
      );
    } else {
      baseDate = birthdayThisYear;
    }

    final difference = now.difference(baseDate);

    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;
    final seconds = difference.inSeconds % 60;

    setState(() {
      _years = years;
      _months = months;
      _days = days;
      _hours = hours;
      _minutes = minutes;
      _seconds = seconds;
    });
  }

  Future<void> _selectBirthDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        _birthDate = selectedDate;
      });

      _calculateAge();

      _timer?.cancel();

      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) {
          _calculateAge();
        },
      );
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondaryColor,
        title: Text(
          'Tanggal ke Umur',
          style: AppTextStyles.poppinsBold.copyWith(
            color: AppColors.secondaryColor,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              'Hitung Umur',
              style: AppTextStyles.poppinsBold.copyWith(
                color: AppColors.secondaryColor,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Masukkan tanggal lahir untuk mengetahui umur kamu.',
              textAlign: TextAlign.center,
              style: AppTextStyles.jostRegular.copyWith(
                color: AppColors.secondaryColor,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _selectBirthDate,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  _birthDate == null
                      ? 'Pilih Tanggal Lahir'
                      : _formatDate(_birthDate!),
                  style: AppTextStyles.jostBold.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            if (_birthDate != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'Umur Kamu',
                      style: AppTextStyles.poppinsBold.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 20),

                    _ageText('Tahun', _years),
                    _ageText('Bulan', _months),
                    _ageText('Hari', _days),
                    _ageText('Jam', _hours),
                    _ageText('Menit', _minutes),
                    _ageText('Detik', _seconds),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _ageText(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.jostRegular.copyWith(
              color: AppColors.primaryColor,
              fontSize: 14,
            ),
          ),
          Text(
            '$value',
            style: AppTextStyles.jostBold.copyWith(
              color: AppColors.primaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}