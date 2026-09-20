import 'package:flutter/material.dart';
import 'package:tugas1_mobile/components/delete_account_card.dart';
import 'package:tugas1_mobile/components/profil_menu_card.dart';
import 'package:tugas1_mobile/page/faq.dart';
import 'package:tugas1_mobile/page/login.dart';
import 'package:tugas1_mobile/page/profil%20page/account.dart';
import 'package:tugas1_mobile/page/profil%20page/editPassword.dart';
import 'package:tugas1_mobile/services/auth_service.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final loggedUser = await AuthService.getLoggedUser();

    if (!mounted) return;

    setState(() {
      user = loggedUser;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text("User tidak ditemukan"),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                  Text(
                    "Profil",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 32,
                      color: AppColors.secondaryColor,
                    ),
                  ),

                  GestureDetector(
                    onTap: () async {
                      final success = await AuthService.logout();

                      if (success) {
                        if (!context.mounted) return;

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (route) => false,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Berhasil Logout'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal Logout'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.red,), 
                  ),
                ],
              ),

              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                  ),

                  Image.asset(
                    "assets/icons/profil.png",
                    width: 100,
                    height: 100,
                  ),

                  Text(
                    user!.name,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 24,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4),
                  ),

                  Text(
                    "Account Details",
                    textAlign: TextAlign.left,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 16,
                      color: AppColors.secondaryColor,
                    ),
                  ),

                  Divider(
                    color: AppColors.secondaryColor,
                  ),
                ],
              ),

              ProfilMenuCard(
                title: "Account",
                iconPath: "assets/icons/account.png",
                page: const Account(),
              ),

              ProfilMenuCard(
                title: "Password",
                iconPath: "assets/icons/password.png",
                page: const Editpassword(),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4),
                  ),

                  Text(
                    "General",
                    textAlign: TextAlign.left,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 16,
                      color: AppColors.secondaryColor,
                    ),
                  ),

                  Divider(
                    color: AppColors.secondaryColor,
                  ),
                ],
              ),

              ProfilMenuCard(
                title: "FAQ",
                iconPath: "assets/icons/FAQ.png",
                page: const BantuanPage(),
              ),

              DeleteAccountCard(),
            ],
          ),
        ),
      ),
    );
  }
}