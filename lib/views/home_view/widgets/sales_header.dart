import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/constants/_constants.dart';

class SalesHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      color: AppColors.grey,
      padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Best Sale Product',
              style: AppTextStyles.bold18,
            ),
          ),
          Text(
            'See more',
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 70.h;

  @override
  double get minExtent => 70.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
