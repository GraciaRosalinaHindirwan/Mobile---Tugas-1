import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';
import 'package:tugas1_mobile/page/dashboard.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namaController= TextEditingController();
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _confirmPasswordController = TextEditingController(); 

  void _registerAction() {
    String nama = _namaController.text; 
    String email = _emailController.text; 
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "mobileSeru" && password == "mobileSeru") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Gagal! Username atau Password tidak valid!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose(); 
    _namaController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),

              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // GAMBAR LOGIN
                  Container(
                    width: double.infinity,
                    height: 265,

                    decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20),

                      child: Image.asset(
                        'assets/icons/login.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // FORM LOGIN
                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),

                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TITLE
                        Center(
                          child: Text(
                            'Sign Up',
                            style: AppTextStyles.poppinsBold.copyWith(
                              fontSize: 20,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ),

                        const SizedBox(height: 2),

                        // SUBTITLE
                        Center(
                          child: Text(
                            'Masukkan Username dan Password',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.jostRegular.copyWith(
                              fontSize: 11,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        InputCardComponent(
                          label: 'Nama', 
                          hint: '', 
                          controller: _namaController),

                        InputCardComponent(
                          label: "Email", 
                          hint: '', 
                          controller: _emailController), 

                        // USERNAME
                        InputCardComponent(
                          label: 'Username',
                          controller: _usernameController,
                          hint: '',
                        ),

                        const SizedBox(height: 12),

                        // PASSWORD
                        InputCardComponent(
                          label: 'Password',
                          controller: _passwordController,
                          hint: '',
                          obscureText: true,
                        ),

                        const SizedBox(height: 65),

                        // BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 38,

                          child: OutlinedButton(
                            onPressed: _registerAction,

                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: AppColors.secondaryColor,
                                width: 1,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),

                            child: Text(
                              'Sign In',
                              style: AppTextStyles.jostBold.copyWith(
                                fontSize: 12,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
