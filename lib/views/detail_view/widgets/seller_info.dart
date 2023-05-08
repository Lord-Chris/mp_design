import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/components/_components.dart';
import '../../../shared/constants/_constants.dart';

class SellerInfo extends StatelessWidget {
  const SellerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seller Information:',
          style: AppTextStyles.bold16,
        ),
        Spacing.vertRegular(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: AppColors.brandColor1.withOpacity(.2),
                  child: Container(
                    padding: REdgeInsets.all(8),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          'Thrifting\nStore.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bold14.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 3,
                  child: CircleAvatar(
                    radius: 10.r,
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.circle,
                      size: 17,
                      color: AppColors.brandColor1.withOpacity(.3),
                    ),
                  ),
                ),
              ],
            ),
            Spacing.horizMedium(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thrifting_store',
                    style: AppTextStyles.bold18,
                  ),
                  Spacing.vertSmall(),
                  Text(
                    'Active 5 mins ago | 96.7% positive Feedback',
                    style: AppTextStyles.regular13.copyWith(
                      color: AppColors.black.withOpacity(.5),
                    ),
                  ),
                  Spacing.vertSmall(),
                  AppButton(
                    label: 'Visit Store',
                    hasBorder: true,
                    borderColor: AppColors.green,
                    buttonColor: AppColors.transparent,
                    labelColor: AppColors.green,
                    isCollapsed: true,
                    fontWeight: FontWeight.bold,
                    padding: REdgeInsets.fromLTRB(25, 10, 25, 10),
                    prefixWidget: Icon(
                      CupertinoIcons.shopping_cart,
                      size: 15.r,
                      color: AppColors.green,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
