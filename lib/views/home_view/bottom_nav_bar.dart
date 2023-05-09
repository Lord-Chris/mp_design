import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/constants/_constants.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final icons = [
    Icons.home,
    Icons.receipt_long_rounded,
    Icons.wallet,
    Icons.settings
  ];
  final labels = [
    'Home',
    'Voucher',
    'Wallet',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: 0,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.deepGrey.withOpacity(.6),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyles.bold12.copyWith(
        color: AppColors.black,
      ),
      iconSize: 25.r,
      unselectedLabelStyle: AppTextStyles.medium12.copyWith(
        color: AppColors.deepGrey,
      ),
      useLegacyColorScheme: false,
      items: [
        for (int i = 0; i < icons.length; i++)
          BottomNavigationBarItem(
            icon: Padding(
              padding: REdgeInsets.all(5),
              child: Icon(icons[i]),
            ),
            label: labels[i],
          ),
      ],
    );
  }
}
