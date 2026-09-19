import 'package:flutter/material.dart';
import 'package:tugas1_mobile/page/profil%20page/editNama.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';
import 'package:tugas1_mobile/services/auth_service.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final loggedUser = await AuthService.getLoggedUser();

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
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/back.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  Text(
                    "Account",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: 32,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),

              Image.asset(
                "assets/icons/profil.png",
                width: 100,
                height: 100,
              ),

              // NAMA
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Editnama(),
                    ),
                  ).then((_) {
                    loadUser();
                  });
                },
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/reduce-user.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama",
                          style: AppTextStyles.poppinsBold.copyWith(
                            fontSize: 16,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        Text(
                          user!.name,
                          style: AppTextStyles.poppinsRegular.copyWith(
                            fontSize: 16,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // USERNAME
              Row(
                children: [
                  Image.asset(
                    "assets/icons/reduce-user.png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Pengguna",
                        style: AppTextStyles.poppinsBold.copyWith(
                          fontSize: 16,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      Text(
                        "@${user!.username}",
                        style: AppTextStyles.poppinsRegular.copyWith(
                          fontSize: 16,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // EMAIL
              Row(
                children: [
                  Image.asset(
                    "assets/icons/email.png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: AppTextStyles.poppinsBold.copyWith(
                          fontSize: 16,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      Text(
                        user!.email,
                        style: AppTextStyles.poppinsRegular.copyWith(
                          fontSize: 16,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
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