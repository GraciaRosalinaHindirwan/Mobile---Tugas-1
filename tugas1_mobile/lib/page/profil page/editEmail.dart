import 'package:flutter/material.dart';
import 'package:tugas1_mobile/layouts/editPage_layouts.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/components/button_save.dart';

class Editemail extends StatefulWidget {
  
  const Editemail({super.key});

  @override
  State<Editemail> createState() => _EditemailState();
}

class _EditemailState extends State<Editemail> {
  final TextEditingController controller = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return EditpageLayouts(
      title: "Email",
      content: Column(
        spacing: 24,
        children: [
          InputCardComponent(label: "Email Anda", hint: '', controller: controller),
          ButtonSave(onPressed: (){}), 
        ],
      ),
    );
  }
}