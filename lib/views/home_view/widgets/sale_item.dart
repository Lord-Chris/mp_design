import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/views/detail_view/detail_view.dart';

import '../../../shared/constants/_constants.dart';

class SaleItem extends StatelessWidget {
  final int index;
  const SaleItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DetailView()),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: index == 0
              ? AppColors.white.withOpacity(1)
              : AppColors.transparent,
          boxShadow: [
            if (index == 0)
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
                  Image.network(
                    AppConstants.mockImage,
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
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.black.withOpacity(.5),
                    ),
                  ),
                  Spacing.vertExtraTiny(),
                  Text(
                    "Essential Men's Short-Sleeve Crewneck T-shirt",
                    style: AppTextStyles.bold14,
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
