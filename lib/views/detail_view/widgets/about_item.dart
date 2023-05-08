import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/components/fader_widget.dart';

import '../../../shared/constants/_constants.dart';

class AboutItem extends HookWidget {
  const AboutItem({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    return FaderWidget(
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  controller: tabController,
                  tabs: [
                    SizedBox(
                      height: 35.h,
                      child: Padding(
                        padding: REdgeInsets.symmetric(horizontal: 10),
                        child: const Tab(
                          text: 'About Item',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                      child: Padding(
                        padding: REdgeInsets.symmetric(horizontal: 10),
                        child: const Tab(
                          text: 'Reviews',
                        ),
                      ),
                    ),
                  ],
                  indicatorWeight: 2,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: Colors.red,
                  splashBorderRadius: BorderRadius.zero,
                  labelColor: AppColors.green,
                  indicatorColor: AppColors.green,
                  unselectedLabelColor: AppColors.deepGrey,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: REdgeInsets.only(bottom: 0),
                  labelStyle: AppTextStyles.bold16,
                  unselectedLabelStyle: AppTextStyles.medium16,
                  isScrollable: true,
                ),
                const Divider(
                  color: AppColors.deepGrey,
                  height: 0,
                ),
              ],
            ),
          ),
          Spacing.vertSmall(),
          _buildInfo('Brand: ', 'CjaeomMOb', 'Color: ', 'Aprikot'),
          _buildInfo('Category: ', 'Casual Shirt', 'Mineral: ', 'Polyester'),
          _buildInfo('Condition: ', 'New', 'Heavy: ', '200 g'),
        ],
      ),
    );
  }

  Padding _buildInfo(
      String label1, String value1, String label2, String value2) {
    return Padding(
      padding: REdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  label1,
                  style: AppTextStyles.regular13.copyWith(
                    color: AppColors.black.withOpacity(.5),
                  ),
                ),
                Flexible(
                  child: Text(
                    value1,
                    style: AppTextStyles.bold14,
                  ),
                ),
              ],
            ),
          ),
          Spacing.horizRegular(),
          Expanded(
            child: Row(
              children: [
                Text(
                  label2,
                  style: AppTextStyles.regular13.copyWith(
                    color: AppColors.black.withOpacity(.5),
                  ),
                ),
                Flexible(
                  child: Text(
                    value2,
                    style: AppTextStyles.bold14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
