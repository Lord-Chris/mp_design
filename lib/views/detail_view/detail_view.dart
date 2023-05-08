import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/components/_components.dart';
import 'package:mp_design/views/detail_view/widgets/description.dart';
import 'package:mp_design/views/detail_view/widgets/shipping_info.dart';

import '../../shared/constants/_constants.dart';
import '../home_view/widgets/sale_item.dart';
import 'widgets/about_item.dart';
import 'widgets/image_header.dart';
import 'widgets/reviews_n_ratings.dart';
import 'widgets/seller_info.dart';
import 'widgets/top_reviews.dart';

class DetailView extends HookWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLiked = Random().nextBool();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.deepGrey,
        ),
        actions: [
          Icon(
            isLiked ? Icons.favorite_border : Icons.favorite,
            color: isLiked ? AppColors.deepGrey : AppColors.pink,
          ),
          Spacing.horizRegular(),
          const Icon(
            Icons.share_outlined,
            color: AppColors.deepGrey,
          ),
          Spacing.horizRegular(),
          const Center(
            child: Badge(
              label: Text("1"),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.deepGrey,
              ),
            ),
          ),
          Spacing.horizRegular(),
          Spacing.horizExtraTiny(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const ImageHeader(),
                Spacing.vertRegular(),
                const AboutItem(),
                Padding(
                  padding: REdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(color: AppColors.deepGrey),
                      Spacing.vertRegular(),
                      const Description(),
                      const Divider(color: AppColors.deepGrey),
                      Spacing.vertRegular(),
                      const ShippingInfo(),
                      Spacing.vertSmall(),
                      const Divider(color: AppColors.deepGrey),
                      Spacing.vertRegular(),
                      const SellerInfo(),
                      Spacing.vertSmall(),
                      const Divider(color: AppColors.deepGrey),
                      Spacing.vertRegular(),
                      const ReviewsNRatings(),
                      Spacing.vertSmall(),
                      const Divider(color: AppColors.deepGrey),
                      Spacing.vertRegular(),
                      const TopReviews(),
                      Spacing.vertLarge(),
                      Row(
                        children: [
                          Text(
                            'Recommendation',
                            style: AppTextStyles.bold16,
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
                      Spacing.vertMedium(),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 270,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                        ),
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SaleItem(
                            index: index,
                            raise: false,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: REdgeInsets.fromLTRB(20, 20, 15, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: AppTextStyles.regular13.copyWith(
                            color: AppColors.black.withOpacity(.5),
                          ),
                        ),
                        Spacing.vertSmall(),
                        Text(
                          r'$18.00',
                          style: AppTextStyles.bold20.copyWith(
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      label: '',
                      padding: EdgeInsets.zero,
                      customChild: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: AppColors.green,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: AppColors.white,
                                  ),
                                  Spacing.horizSmall(),
                                  Text(
                                    '1',
                                    style: AppTextStyles.medium14.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              color: AppColors.brandColor1,
                              child: Text(
                                'Buy Now',
                                style: AppTextStyles.bold14.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
