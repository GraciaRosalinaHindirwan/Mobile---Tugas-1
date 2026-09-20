import 'package:flutter/material.dart';
import 'package:tugas1_mobile/page/login.dart';
import 'package:tugas1_mobile/services/auth_service.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class DeleteAccountCard extends StatelessWidget {
  const DeleteAccountCard({super.key});
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final success = await AuthService.deleteAccount();

        if (success) {
          if (!context.mounted) return;

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false,
          );
        } else {
          if (!context.mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gagal menghapus akun'),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.red, 
          borderRadius: BorderRadius.circular(16), 
        ),
      
        child: Row(
          children: [
            Icon(Icons.delete), 
      
            const SizedBox(width: 16,), 
      
            Expanded(
              child: Text(
                "Delete Account",
                style: AppTextStyles.poppinsBold.copyWith(
                  fontSize: 20, 
                  color: AppColors.primaryColor, 
                ),
              ),
      
            ),
          ],
        ),
      ),
    );
  }
}