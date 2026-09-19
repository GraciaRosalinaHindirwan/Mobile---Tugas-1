import 'package:flutter/material.dart';
import 'package:tugas1_mobile/layouts/editPage_layouts.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/components/button_save.dart';

class Editphone extends StatefulWidget {
  
  const Editphone({super.key});

  @override
  State<Editphone> createState() => _EditphoneState();
}

class _EditphoneState extends State<Editphone> {
  final TextEditingController controller = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return EditpageLayouts(
      title: "Telepon",
      content: Column(
        spacing: 24,
        children: [
          InputCardComponent(label: "Nomor Telepon Anda", hint: '', controller: controller),
          ButtonSave(onPressed: (){}), 
        ],
      ),
    );
  }
}