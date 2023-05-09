import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/components/app_network_image.dart';

import '../../../shared/constants/_constants.dart';

class ReviewsNRatings extends StatelessWidget {
  const ReviewsNRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews & Ratings',
          style: AppTextStyles.bold16,
        ),
        SizedBox(
          height: 140.r,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacing.vertSmall(),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '4.9',
                            style: AppTextStyles.bold40.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' / 5.0',
                            style: AppTextStyles.medium18.copyWith(
                              color: AppColors.black.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    RatingStars(
                      value: 4.5,
                      onValueChanged: (v) {},
                      starBuilder: (index, color) => Icon(
                        Icons.star_rate_rounded,
                        color: color,
                        size: 20.r,
                      ),
                      starSize: 20.r,
                      starCount: 5,
                      starSpacing: 0,
                      maxValue: 5,
                      maxValueVisibility: false,
                      valueLabelVisibility: false,
                      animationDuration: const Duration(milliseconds: 1000),
                      starOffColor: AppColors.deepGrey.withOpacity(.7),
                      starColor: AppColors.yellow,
                    ),
                    const Spacer(flex: 2),
                    Text(
                      '2.3k+ Reviews',
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.deepGrey,
                      ),
                    ),
                    Spacing.vertSmall(),
                  ],
                ),
              ),
              Spacing.horizSmall(),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStarRating('5', .85, '1.5k'),
                    _buildStarRating('4', .4, '710'),
                    _buildStarRating('3', .2, '140'),
                    _buildStarRating('2', .05, '10'),
                    _buildStarRating('1', .0005, '4'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Spacing.vertRegular(),
        Spacing.vertSmall(),
        Text(
          'Reviews with images & videos',
          style: AppTextStyles.bold16,
        ),
        Spacing.vertRegular(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.filled(140, AppConstants.mockAssetImage)
                .take((1.sw < 800 ? 3.w : 3.r).floor())
                .map(
                  (e) => Padding(
                    padding: REdgeInsets.only(right: 14),
                    child: AppNetworkImage(
                      size: Size.fromRadius(35.r),
                      placeholderAssetImage: e,
                      fit: BoxFit.cover,
                      borderRadius: 15,
                    ),
                  ),
                ),
            SizedBox.square(
              dimension: 70.r,
              child: Stack(
                children: [
                  AppNetworkImage(
                    size: Size.fromRadius(35.r),
                    placeholderAssetImage: AppConstants.mockAssetImage,
                    fit: BoxFit.cover,
                    borderRadius: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.black.withOpacity(.5),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${140 - 3.w.floor()}+',
                      style: AppTextStyles.medium16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStarRating(String value, double progress, String count) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            Icons.star_rate_rounded,
            color: AppColors.yellow,
            size: 20.r,
          ),
          Spacing.horizSmall(),
          Text(
            value,
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.black.withOpacity(.5),
            ),
          ),
          Spacing.horizRegular(),
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 10.r,
              child: CustomPaint(
                painter: RatingPaint(progress: progress),
                child: Container(),
              ),
            ),
          ),
          Spacing.horizRegular(),
          SizedBox(
            width: 30.r,
            child: Text(
              count,
              style: AppTextStyles.medium14.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingPaint extends CustomPainter {
  final double progress;

  const RatingPaint({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()
      ..color = AppColors.deepGrey.withOpacity(.3)
      ..strokeWidth = size.height
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      bg,
    );

    bg.color = AppColors.green;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width * progress, size.height / 2),
      bg,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
