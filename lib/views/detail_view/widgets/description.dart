import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/components/fader_widget.dart';

import '../../../shared/constants/_constants.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: FaderWidget(
        milliSecWait: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: AppTextStyles.bold16,
            ),
            Spacing.vertSmall(),
            _buildDesc(
                'Long-sleeve dress shirt in classic fit featuring button down collar'),
            _buildDesc('Patch pocket on left chest'),
            _buildDesc('Durable Combination Cotton Fabric'),
            _buildDesc('Comfortable and cuality drese shirt'),
            _buildDesc('Go-to classic button down shirt for all occasions'),
            Spacing.vertRegular(),
            Text(
              'Chat us if there is anything you need to ask about the product :)',
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.black.withOpacity(.5),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'See less',
                    style: AppTextStyles.medium14.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: AppColors.black.withOpacity(.5),
                    size: 15.r,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildDesc(String label) {
    return Padding(
      padding: REdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•',
            style: AppTextStyles.medium16.copyWith(
              color: AppColors.black.withOpacity(.5),
            ),
          ),
          Spacing.horizSmall(),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.black.withOpacity(.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
