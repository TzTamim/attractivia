import 'package:attractivia/common/custom_button.dart';
import 'package:attractivia/features/auth/preasentation/log_in_screen.dart';
import 'package:attractivia/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../auth/preasentation/google_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onbording_one.png",
      "title": "Get Applications Instantly",
      "desc":
          "Share your problem. Get AI-powered guidance instantly.",
    },
    {
      "image": "assets/images/onbording_two.png",
      "title": "GenApply",
      "desc":
          "Create any application using your details and purpose—instantly.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    if (_currentPage < onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {}
                  },
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),));
                      });
                    },
                    child: Text(
                      "Skip",
                      style: TextFontStyle.textStyle14c1877F2HelveticaRegular400,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          onboardingData[index]["image"]!,
                          height: 280.h,
                        ),
                        UIHelper.verticalSpace(12.h),
                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStyle16c23243BInter700Bold,
                        ),

                        UIHelper.verticalSpace(12.h),
                        Text(
                          onboardingData[index]["desc"]!,
                          style:
                              TextFontStyle.textStyle16c737373InterRegular400,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.only(right: 8.w),
                    height: 8.h,
                    width: _currentPage == index ? 24.w : 8.w,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.c1877F2
                          : AppColors.cD1D5DC,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),

              UIHelper.verticalSpace(40.h),
              CustomButton(
                onTap: () {
                  if (_currentPage < onboardingData.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoogleScreen()),
                    );
                  }
                },
                btnName: 'Continue',
              ),
              UIHelper.verticalSpace(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
