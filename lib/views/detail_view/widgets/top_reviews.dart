import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/components/_components.dart';
import '../../../shared/constants/_constants.dart';

class TopReviews extends StatelessWidget {
  const TopReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Reviews',
                  style: AppTextStyles.bold16,
                ),
                Spacing.vertSmall(),
                Text(
                  'Showing 3 of 2.3k+ reviews',
                  style: AppTextStyles.medium14.copyWith(
                    color: AppColors.black.withOpacity(.5),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: REdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                color: AppColors.deepGrey.withOpacity(.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.deepGrey.withOpacity(.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Popular',
                    style: AppTextStyles.bold12,
                  ),
                  Spacing.horizRegular(),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.deepGrey.withOpacity(.4),
                  ),
                ],
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.vertMedium(),
                Row(
                  children: [
                    AppNetworkImage(
                      url: AppConstants.mockImage,
                      isCircular: true,
                      size: Size.fromRadius(15.r),
                      fit: BoxFit.cover,
                    ),
                    Spacing.horizSmall(),
                    Expanded(
                      child: Text(
                        'Eren Y****r',
                        style: AppTextStyles.bold14.copyWith(
                          color: AppColors.black.withOpacity(.8),
                        ),
                      ),
                    ),
                    Spacing.horizSmall(),
                    Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.yellow,
                      size: 16.r,
                    ),
                    Spacing.horizTiny(),
                    Text(
                      '5.0',
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.black.withOpacity(.8),
                      ),
                    ),
                    Spacing.horizSmall(),
                    const Icon(
                      Icons.more_horiz_outlined,
                      color: AppColors.deepGrey,
                    ),
                  ],
                ),
                Spacing.vertRegular(),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  runAlignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    'Product in good condition',
                    'Very fast delivery',
                    'Fast seller response',
                  ]
                      .map(
                        (e) => Container(
                          padding: REdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: AppColors.green,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.green.withOpacity(.2),
                          ),
                          child: Text(
                            e,
                            style: AppTextStyles.regular11.copyWith(
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Spacing.vertRegular(),
                Text(
                  'According to my expectations. This is the best. Thank you',
                  style: AppTextStyles.medium13,
                ),
                Spacing.vertRegular(),
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up_alt,
                      color: AppColors.green,
                      size: 13.r,
                    ),
                    Spacing.horizTiny(),
                    Text(
                      'Helpful ?',
                      style: AppTextStyles.medium13.copyWith(
                        color: AppColors.green,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Yesterdays',
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.black.withOpacity(.5),
                        letterSpacing: -.3,
                      ),
                    ),
                  ],
                ),
                Spacing.vertRegular(),
                const Divider(color: AppColors.deepGrey),
              ],
            );
          },
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    color: AppColors.grey,
                    elevation: 0,
                    minWidth: 20.r,
                    height: 25.r,
                    child: Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: AppColors.deepGrey,
                      size: 15.r,
                    ),
                  ),
                  ...List.generate(20, (i) => i + 1).take(3.w.floor()).map(
                        (e) => Text(
                          e.toString(),
                          style: AppTextStyles.regular13.copyWith(
                            color: e == 1 ? AppColors.green : null,
                          ),
                        ),
                      ),
                  if (20 - 3.w > 0)
                    Text(
                      '...',
                      style: AppTextStyles.regular13,
                    ),
                  MaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    color: AppColors.white,
                    elevation: 2,
                    minWidth: 20.r,
                    height: 25.r,
                    child: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: AppColors.deepGrey,
                      size: 15.r,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'See more',
              style: AppTextStyles.medium14.copyWith(
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
