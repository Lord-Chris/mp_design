import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/constants/_constants.dart';
import 'package:mp_design/views/home_view/setting_page.dart';
import 'package:mp_design/views/home_view/voucher_screen.dart';
import 'package:mp_design/views/home_view/wallet_screen.dart';

import 'widgets/app_bar.dart';
import 'widgets/category_list.dart';
import 'widgets/sale_item.dart';
import 'widgets/sales_header.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final icons = [
    Icons.home,
    Icons.receipt_long_rounded,
    Icons.wallet,
    Icons.settings
  ];

  final labels = [
    'Home',
    'Voucher',
    'Wallet',
    'Settings',
  ];

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const VoucherScreen(),
    const WalletScreen(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          selectedItemColor: AppColors.green,
          unselectedItemColor: AppColors.deepGrey.withOpacity(.6),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: AppTextStyles.bold12.copyWith(
            color: AppColors.black,
          ),
          iconSize: 25.r,
          unselectedLabelStyle: AppTextStyles.medium12.copyWith(
            color: AppColors.deepGrey,
          ),
          useLegacyColorScheme: false,
          items: [
            for (int i = 0; i < icons.length; i++)
              BottomNavigationBarItem(
                icon: Padding(
                  padding: REdgeInsets.all(5),
                  child: Icon(icons[i]),
                ),
                label: labels[i],
              ),
          ],
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        MySliverAppBar(
          innerBoxIsScrolled: innerBoxIsScrolled,
        ),
        SliverToBoxAdapter(
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
    );
  }
}
