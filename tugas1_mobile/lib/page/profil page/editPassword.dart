import 'package:flutter/material.dart';
import 'package:tugas1_mobile/layouts/editPage_layouts.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/components/button_save.dart';
import 'package:tugas1_mobile/services/auth_service.dart';

class Editpassword extends StatefulWidget {
  
  const Editpassword({super.key});

  @override
  State<Editpassword> createState() => _EditpasswordState();
}

class _EditpasswordState extends State<Editpassword> {
  final TextEditingController controller = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return EditpageLayouts(
      title: "Password",
      content: Column(
        spacing: 24,
        children: [
          InputCardComponent(label: "Masukkan Password Baru", hint: '', controller: controller),
          InputCardComponent(label: "Konfirmasi Password Baru", hint: '', controller: controller),

          ButtonSave(onPressed: ()async{
            if(await AuthService.changePassword(controller.text)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Password berhasil diperbarui"),
                  backgroundColor: Colors.green,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Login Gagal! Username atau Password tidak valid!"),
                  backgroundColor: Colors.red,
                ),
              );
            }

            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}