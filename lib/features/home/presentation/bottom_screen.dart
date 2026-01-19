import 'package:attractivia/constants/text_font_style.dart';
import 'package:attractivia/features/documents/presentation/document_screen.dart';
import 'package:attractivia/features/home/presentation/home_screen.dart';
import 'package:attractivia/features/mycases/presentation/my_cases_screen.dart';
import 'package:attractivia/features/profile/presentation/profile_screen.dart';
import 'package:attractivia/features/scan/presentation/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    DocumentScreen(),
    ScanScreen(),
    MyCasesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Image.asset('assets/images/profile.png'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20.h,
              width: 74.w,
              decoration: BoxDecoration(
                color: AppColors.cD08700,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Assets.icons.upgradeIcon.image(
                      height: 12,
                      width: 12,
                      color: AppColors.cFFFFFF,
                    ),
                  ),
                  Text(
                    'Upgrade',
                    style: TextFontStyle.textStyle12cFFFFFFInterRegular400,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(8.h),
            Text(
              "Sarah Ahmed",
              style: TextFontStyle.textStyle18c23243BDOnest600,
            ),
          ],
        ),
        actions: [
          Text('果', style: TextFontStyle.textStyle14c6B6B6BInterMedium500),
          Row(
            children: [
              Text('En', style: TextFontStyle.textStyle14c6B6B6BInterMedium500),
              const Icon(Icons.keyboard_arrow_down, color: AppColors.c6B6B6B),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Assets.icons.notiificationIcon.image(
                height: 16,
                width: 16,
              ),
            ),
          ),
        ],
      ),

      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: AppColors.cFFFFFF,
        selectedItemColor: AppColors.c1877F2,
        unselectedItemColor: AppColors.c505050,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: [
          _navItem(
            0,
            Image.asset(
              Assets.icons.homeIcon.path,
              height: 24.h,
              width: 24.w,
              color: _currentIndex == 0 ? AppColors.cFFFFFF : AppColors.c505050,
            ),
            "Home",
          ),
          _navItem(
            1,
            Image.asset(
              Assets.icons.documentIcon.path,
              height: 24.h,
              width: 24.w,
              color: _currentIndex == 1 ? AppColors.cFFFFFF : AppColors.c505050,
            ),
            "Document",
          ),
          _navItem(
            2,
            Image.asset(
              Assets.icons.scanIcon.path,
              height: 24.h,
              width: 24.w,
              color: _currentIndex == 2 ? AppColors.cFFFFFF : AppColors.c505050,
            ),
            "Scanner",
          ),
          _navItem(3, Image.asset(Assets.icons.myCaseIcon.path,
              height: 24.h,
              width: 24.w,
              color: _currentIndex == 3 ? AppColors.cFFFFFF : AppColors.c505050,
            ), "My Cases"),
          _navItem(
            4,
            Image.asset(
              Assets.icons.profileIcon.path,
              height: 24.h,
              width: 24.w,
              color: _currentIndex == 4 ? AppColors.cFFFFFF : AppColors.c505050,
            ),
            "Profile",
          ),
        ],
      ),
    );
  }
  BottomNavigationBarItem _navItem(int index, Widget icon, String label) {
    final bool isSelected = _currentIndex == index;

    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        height: 50.h,
        width: 50.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.c1877F2 : AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
