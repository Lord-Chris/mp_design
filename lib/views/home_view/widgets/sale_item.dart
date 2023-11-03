import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/views/detail_view/detail_view.dart';

import '../../../shared/constants/_constants.dart';

class SaleItem extends StatelessWidget {
  final int index;
  final bool raise;
  const SaleItem({
    Key? key,
    required this.index,
    this.raise = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      hint: 'Double Tap to see product details',
      button: false,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DetailView()),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: index == 0 && raise
              ? AppColors.white.withOpacity(1)
              : AppColors.transparent,
          boxShadow: [
            if (index == 0 && raise)
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 4),
                color: AppColors.black.withOpacity(.2),
              ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    AppConstants.mockAssetImage,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Builder(builder: (context) {
                      final isLiked = Random().nextBool();
                      return Icon(
                        isLiked ? Icons.favorite_border : Icons.favorite,
                        color: isLiked ? AppColors.black : AppColors.pink,
                      );
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shirt',
                    style: AppTextStyles.regular11.copyWith(
                      color: AppColors.black.withOpacity(.5),
                    ),
                  ),
                  Spacing.vertExtraTiny(),
                  Text(
                    "Essential Men's Short-Sleeve Crewneck T-shirt",
                    style: AppTextStyles.bold13.copyWith(
                      letterSpacing: -.2,
                    ),
                  ),
                  Spacing.vertSmall(),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: AppColors.yellow,
                        size: 16.r,
                      ),
                      Spacing.horizTiny(),
                      Text(
                        '4.9 | 2396',
                        style: AppTextStyles.regular11.copyWith(
                          color: AppColors.black.withOpacity(.5),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            r'$12.00',
                            style: AppTextStyles.bold16.copyWith(
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
