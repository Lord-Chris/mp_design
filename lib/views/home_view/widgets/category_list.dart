import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/views/home_view/detail_category_screen.dart';
import '../../../shared/components/_components.dart';
import '../../../shared/constants/_constants.dart';

class CategoryList extends HookWidget {
  CategoryList({
    super.key,
  });
  final labels = ['Category', 'Flight', 'Bill', 'Data Plan', 'Top-up'];
  final icons = [
    Icons.category,
    Icons.flight,
    Icons.receipt,
    Icons.signal_wifi_statusbar_connected_no_internet_4,
    Icons.monetization_on,
  ];

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
                      Spacing.horizRegular(),
                      for (int i = 0; i < icons.length; i++)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailCategoryScreen(
                                          icon: icons.first,
                                          label: labels.first,
                                        )),
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: REdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: AppColors.grey,
                                  ),
                                  child: Icon(
                                    icons[i],
                                    color: AppColors.deepGrey,
                                    size: 17.r,
                                  ),
                                ),
                                Spacing.vertSmall(),
                                Text(
                                  labels[i],
                                  style: AppTextStyles.regular13.copyWith(
                                    color: AppColors.black.withOpacity(.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Spacing.horizRegular(),
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
