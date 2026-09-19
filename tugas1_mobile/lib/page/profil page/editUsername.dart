import 'package:flutter/material.dart';
import 'package:tugas1_mobile/layouts/editPage_layouts.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/components/button_save.dart';

class Editusername extends StatefulWidget {
  
  const Editusername({super.key});

  @override
  State<Editusername> createState() => _EditusernameState();
}

class _EditusernameState extends State<Editusername> {
  final TextEditingController controller = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return EditpageLayouts(
      title: "Username",
      content: Column(
        spacing: 24,
        children: [
          InputCardComponent(label: "Username Anda", hint: '', controller: controller),
          ButtonSave(onPressed: (){}), 
        ],
      ),
    );
  }
}