import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/components/fader_widget.dart';

import '../../../shared/constants/_constants.dart';

class ImageHeader extends HookWidget {
  const ImageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaderWidget(
          child: Container(
            height: .39.sh,
            margin: REdgeInsets.all(20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(AppConstants.mockAssetImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                // Positioned.fill(
                //   child: Image.network(
                //     AppConstants.mockImage,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black26, Colors.transparent],
                      stops: [.2, 1],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Column(
                    children: [
                      ...List.filled(3, AppConstants.mockAssetImage).map(
                        (e) => Container(
                          height: 40.r,
                          width: 40.r,
                          margin: REdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(e),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        FaderWidget(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.shopping_cart,
                      size: 15.r,
                      color: AppColors.black.withOpacity(.5),
                    ),
                    Spacing.horizSmall(),
                    Text(
                      'tokobaju.id',
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.black.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
                Spacing.vertSmall(),
                Text(
                  "Essential Men's Short-Sleeve Crewneck T-shirt",
                  style: AppTextStyles.bold20,
                ),
                Spacing.vertRegular(),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.yellow,
                      size: 16.r,
                    ),
                    Flexible(
                      child: Text(
                        '4.9 Ratings',
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.black.withOpacity(.5),
                        ),
                      ),
                    ),
                    Spacing.horizSmall(),
                    Text(
                      '•',
                      style: AppTextStyles.medium18.copyWith(
                        color: AppColors.black.withOpacity(.5),
                      ),
                    ),
                    Spacing.horizSmall(),
                    Flexible(
                      child: Center(
                        child: Text(
                          '2.3k+ Reviews',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: AppTextStyles.medium16.copyWith(
                            color: AppColors.black.withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                    Spacing.horizSmall(),
                    Text(
                      '•',
                      style: AppTextStyles.medium18.copyWith(
                        color: AppColors.black.withOpacity(.5),
                      ),
                    ),
                    Spacing.horizSmall(),
                    Flexible(
                      child: Center(
                        child: Text(
                          '2.9k+ Sold',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: AppTextStyles.medium16.copyWith(
                            color: AppColors.black.withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
