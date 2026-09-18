import 'package:flutter/material.dart';
import 'package:tugas1_mobile/theme/app_colors.dart';
import 'package:tugas1_mobile/theme/app_text_styles.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // BACKGROUND NAVBAR
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                border: Border(
                  top: BorderSide(
                    color: AppColors.textColor,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          // STOPWATCH
          Positioned(
            left: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width / 3,
            height: 65,
            child: _NavItem(
              icon: Icons.timer_outlined,
              selectedIcon: Icons.timer,
              label: 'Stopwatch',
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
          ),
          // BANTUAN
          Positioned(
            right: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width / 3,
            height: 65,
            child: _NavItem(
              icon: Icons.help_outline,
              selectedIcon: Icons.help,
              label: 'Bantuan',
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
          ),
          // HOME - TENGAH & MENONJOL
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(0),
              child: Column(
                children: [

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: currentIndex == 0 ? 62 : 58,
                    height: currentIndex == 0 ? 62 : 58,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      color: AppColors.primaryColor,

                      border: Border.all(
                        color: AppColors.secondaryColor,
                        width: 4,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Icon(
                      currentIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,

                      color: AppColors.secondaryColor,

                      size: 30,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    'Home',
                    style: AppTextStyles.jostBold.copyWith(
                      fontSize: 11,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// NAV ITEM
class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            isSelected ? selectedIcon : icon,
            color: AppColors.primaryColor,
            size: 25,
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: AppTextStyles.jostBold.copyWith(
              fontSize: 11,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}