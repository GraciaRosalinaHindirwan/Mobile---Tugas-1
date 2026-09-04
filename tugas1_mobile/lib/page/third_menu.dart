import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/answer_card.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  State<OddEvenPage> createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final controller = TextEditingController();

  String hasil = '0';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void cekBilangan() {
    final angka = int.tryParse(controller.text.trim());

    if (angka == null) {
      setState(() {
        hasil = 'Input tidak valid';
      });
      return;
    }

    setState(() {
      if (angka % 2 == 0) {
        hasil = '$angka adalah bilangan GENAP';
      } else {
        hasil = '$angka adalah bilangan GANJIL';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Ganjil & Genap'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: 'Masukkan bilangan',
                hintText: 'Contoh: 17',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,

              child: FilledButton(
                onPressed: cekBilangan,
                child: const Text('JALANKAN'),
              ),
            ),

            const SizedBox(height: 24),

            AnswerCardComponent(
              answerEntity: AnswerEntity(
                question: 'Jawaban',
                answer: hasil,
              ),
            ),
          ],
        ),
      ),
    );
  }
}