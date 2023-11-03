import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/components/fader_widget.dart';

import '../../../shared/constants/_constants.dart';

class ShippingInfo extends StatelessWidget {
  const ShippingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: FaderWidget(
        milliSecWait: 800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shippings Information:',
              style: AppTextStyles.bold16,
            ),
            Spacing.vertSmall(),
            _buildShipInfo('Delivery: ', 'Shipping from Jakarta, Indonesia'),
            _buildShipInfo('Shipping: ', 'FREE International Shipping'),
            _buildShipInfo('Arrive: ', 'Fetimated arrival on 25 - 27 Oct 2029'),
          ],
        ),
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
          Spacing.horizTiny(),
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
