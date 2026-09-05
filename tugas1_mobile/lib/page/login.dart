import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/input_card.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';
import 'package:tugas1_mobile/page/menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _loginAction() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "pakgood" && password == "gusbar1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MenuPage()),
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
                            'Sign In',
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
                        ),

                        const SizedBox(height: 65),

                        // BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 38,

                          child: OutlinedButton(
                            onPressed: _loginAction,

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
