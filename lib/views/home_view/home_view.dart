import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/constants/_constants.dart';

import 'widgets/app_bar.dart';
import 'widgets/category_list.dart';
import 'widgets/sale_item.dart';
import 'widgets/sales_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            innerBoxIsScrolled: innerBoxIsScrolled,
          ),
          const SliverToBoxAdapter(
            child: CategoryList(),
          ),
          SliverPersistentHeader(
            delegate: SalesHeader(),
            pinned: true,
          ),
        ],
        body: Container(
          color: AppColors.grey.withOpacity(.5),
          child: GridView.builder(
            padding: REdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 270,
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return SaleItem(index: index);
            },
          ),
        ),
      ),
    );
  }
}
