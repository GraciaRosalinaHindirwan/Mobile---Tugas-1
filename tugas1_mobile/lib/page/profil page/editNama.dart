import 'package:flutter/material.dart';
import 'package:tugas1_mobile/layouts/editPage_layouts.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/components/button_save.dart';

class Editnama extends StatefulWidget {
  
  const Editnama({super.key});

  @override
  State<Editnama> createState() => _EditnamaState();
}

class _EditnamaState extends State<Editnama> {
  final TextEditingController controller = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return EditpageLayouts(
      title: "Nama",
      content: Column(
        spacing: 24,
        children: [
          InputCardComponent(label: "Nama Anda", hint: '', controller: controller),
          ButtonSave(onPressed: (){}), 
        ],
      ),
    );
  }
}