import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/components/_components.dart';
import 'package:mp_design/views/detail_view/widgets/description.dart';

import '../../shared/constants/_constants.dart';
import 'widgets/about_item.dart';
import 'widgets/image_header.dart';

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
                CupertinoIcons.chat_bubble_text,
                color: AppColors.deepGrey,
              ),
            ),
          ),
          Spacing.horizRegular(),
          Spacing.horizExtraTiny(),
        ],
      ),
      body: ListView(
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
                Text(
                  'Shippings Information:',
                  style: AppTextStyles.bold16,
                ),
                Spacing.vertSmall(),
                _buildShipInfo(
                    'Delivery: ', 'Shipping from Jakarta, Indonesia'),
                _buildShipInfo('Shipping: ', 'FREE International Shipping'),
                _buildShipInfo('Arrive: ', 'Fetimated arrival.or 290 2029'),
                Spacing.vertSmall(),
                const Divider(color: AppColors.deepGrey),
                Spacing.vertRegular(),
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
                          backgroundColor:
                              AppColors.brandColor1.withOpacity(.2),
                          child: Center(
                            child: Text(
                              'Thrifting\nStore.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bold14.copyWith(
                                color: AppColors.black,
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
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildShipInfo(String label, String value) {
    return Padding(
      padding: REdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyles.regular13.copyWith(
              color: AppColors.black.withOpacity(.5),
            ),
          ),
          Spacing.vertTiny(),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bold14,
            ),
          ),
        ],
      ),
    );
  }
}
