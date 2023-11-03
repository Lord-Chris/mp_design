import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/constants/app_colors.dart';
import 'package:mp_design/shared/constants/app_textstyles.dart';
import 'package:mp_design/shared/constants/spacing.dart';

class DetailCategoryScreen extends StatelessWidget {
  final String label;
  final IconData icon;

  DetailCategoryScreen({super.key, required this.label, required this.icon});
  final labels = ['Category', 'Flight', 'Bill', 'Data Plan', 'Top-up'];
  final icons = [
    Icons.category,
    Icons.flight,
    Icons.receipt,
    Icons.signal_wifi_statusbar_connected_no_internet_4,
    Icons.monetization_on,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.deepGrey,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            padding: REdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppColors.grey,
            ),
            child: Icon(
              icon,
              color: AppColors.deepGrey,
              size: 100.r,
            ),
          ),
          Spacing.vertLarge(),
          Text(
            label,
            style: AppTextStyles.regular16.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: AppColors.black.withOpacity(.5),
            ),
          ),
        ],
      ),
    );
  }
}
