import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/components/_components.dart';
import '../../../shared/constants/_constants.dart';

class CategoryList extends HookWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final page = useListenableSelector(
        controller, () => (controller.hasClients) ? controller.page : 0);
    return Container(
      color: AppColors.white,
      height: 100.h,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                ...List.filled(3, true).map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.filled(5, true).map(
                        (e) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: REdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: AppColors.grey,
                              ),
                              child: const Icon(Icons.ac_unit_outlined),
                            ),
                            Spacing.vertTiny(),
                            Text(
                              'Category',
                              style: AppTextStyles.regular13,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          CarouselIndicator(
            length: 3,
            spacing: 3.w,
            currentIndex: (page ?? 0).toInt(),
            activeWidget: Container(
              height: 3,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: AppColors.black,
              ),
            ),
            inactiveWidget: const CircleAvatar(
              radius: 1.5,
              backgroundColor: AppColors.grey,
            ),
          ),
          Spacing.vertSmall(),
        ],
      ),
    );
  }
}
