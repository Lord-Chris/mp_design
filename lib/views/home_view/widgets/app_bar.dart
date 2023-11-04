import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/components/_components.dart';
import '../../../shared/constants/_constants.dart';

class MySliverAppBar extends StatelessWidget {
  final bool innerBoxIsScrolled;
  const MySliverAppBar({
    Key? key,
    required this.innerBoxIsScrolled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: (1.sh < 800) ? 270.h : 200.h,
      forceElevated: innerBoxIsScrolled,
      backgroundColor: AppColors.white,
      elevation: 0,
      stretch: true,
      snap: false,
      floating: false,
      collapsedHeight: 70.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Semantics(
          slider: true,
          child: PageView(
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                color: AppColors.grey,
                child: SafeArea(
                  child: Padding(
                    padding: REdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacing.vertLarge(),
                        if (1.sh < 800) const Spacer(flex: 2),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              '#FASHION DAY',
                              style: AppTextStyles.medium14,
                            ),
                            const Spacer(),
                            CarouselIndicator(
                              length: 3,
                              spacing: 3.w,
                              currentIndex: 0,
                              activeWidget: Container(
                                height: 3,
                                width: 7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColors.black,
                                ),
                              ),
                              inactiveWidget: const CircleAvatar(
                                radius: 1.5,
                                backgroundColor: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacing.vertExtraTiny(),
                        Text(
                          '80% OFF',
                          style: AppTextStyles.bold28,
                        ),
                        Spacing.vertSmall(),
                        Text(
                          'Discover Fashion that suits\nyour style.',
                          style: AppTextStyles.regular12,
                        ),
                        const Spacer(),
                        AppButton(
                          label: 'Check this Out',
                          isCollapsed: true,
                          labelSize: 12,
                          onTap: () {},
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: AppColors.lightPink.withOpacity(.5),
                child: SafeArea(
                  child: Padding(
                    padding: REdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacing.vertLarge(),
                        const Spacer(flex: 3),
                        Row(
                          children: [
                            Text(
                              '#BEAUTYSALE',
                              style: AppTextStyles.medium14,
                            ),
                            const Spacer(),
                            CarouselIndicator(
                              length: 3,
                              spacing: 3.w,
                              currentIndex: 1,
                              activeWidget: Container(
                                height: 3,
                                width: 7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColors.black,
                                ),
                              ),
                              inactiveWidget: const CircleAvatar(
                                radius: 1.5,
                                backgroundColor: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Spacing.vertExtraTiny(),
                        Text(
                          'DISCOVER OUR\nBEAUTY SELECTION',
                          style: AppTextStyles.medium18,
                        ),
                        const Spacer(),
                        AppButton(
                          label: 'Check this Out',
                          isCollapsed: true,
                          labelSize: 12,
                          onTap: () {},
                        ),
                        Spacing.vertTiny(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search..',
          prefixIcon: const Icon(Icons.search),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.grey,
            ),
          ),
        ),
      ),
      actions: [
        MergeSemantics(
          child: Center(
            child: Badge(
              label: const Text("1"),

              // TODO: Semantics
              child: Semantics(
                label: 'Cart Button',
                hint: 'Double Tap to go to checkout',
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.deepGrey,
                ),
              ),
            ),
          ),
        ),
        Spacing.horizSmall(),
        Spacing.horizSmall(),
        IconButton(
          tooltip: 'Messages',
          onPressed: () {},
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          icon: const Badge(
            label: Text("1"),
            child: Icon(
              CupertinoIcons.chat_bubble_text,
              color: AppColors.deepGrey,
            ),
          ),
        ),
        Spacing.horizTiny(),
        Spacing.horizSmall(),
      ],
    );
  }
}
