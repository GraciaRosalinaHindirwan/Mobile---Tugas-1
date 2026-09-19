import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/result_card.dart';
import 'package:tugas1_mobile/components/button_submit.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';
import 'package:tugas1_mobile/services/stopwatch_service.dart';

class StopwatchMenuPage extends StatefulWidget {
  const StopwatchMenuPage({super.key});

  @override
  State<StopwatchMenuPage> createState() => _StopwatchMenuPageState();
}

class _StopwatchMenuPageState extends State<StopwatchMenuPage> {
  final StopwatchService _service = StopwatchService();
  String _display = "00:00:00";

  @override
  void initState() {
    super.initState();
    _service.onTick = (duration) {
      setState(() {
        _display = _service.formatTime(duration);
      });
    };
  }

  @override
  void dispose() {
    _service.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
                      'Stopwatch',
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
                    'assets/icons/stopwatch.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    'Gunakan stopwatch untuk mengukur waktu secara langsung.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.jostRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),

              // tampilan waktu
              ResultCard(title: "Waktu Berjalan", result: _display),

              // tombol kontrol
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: ButtonSubmit(
                      label: "Start",
                      onPressed: () {
                        _service.start();
                      },
                    ),
                  ),
                  Expanded(
                    child: ButtonSubmit(
                      label: "Stop",
                      onPressed: () {
                        _service.stop();
                      },
                    ),
                  ),
                  Expanded(
                    child: ButtonSubmit(
                      label: "Reset",
                      onPressed: () {
                        _service.reset();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
