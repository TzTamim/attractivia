import 'package:attractivia/constants/text_font_style.dart';
import 'package:attractivia/features/onboarding/presentation/onboarding_screen.dart';
import 'package:attractivia/gen/colors.gen.dart';
import 'package:attractivia/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 6), () {
      Get.off(() => const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UIHelper.verticalSpace(270.h),

            Image.asset(Assets.images.genapplyLogo.path),

            UIHelper.verticalSpace(8.h),

            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => LinearGradient(
                colors: [AppColors.c000000, AppColors.c1877F2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                'GenApply',
                style: TextFontStyle.textStyle24c1877F2Helvetica700Bold
                    .copyWith(color: Colors.white),
              ),
            ),

            UIHelper.verticalSpace(8.h),

            Text(
              'Your AI application in one tap',
              style: TextFontStyle.textStyle16c1877F2Regular700Bold,
            ),

            UIHelper.verticalSpace(320.h),

            Text.rich(
              TextSpan(
                text: 'Powered by ',
                style: TextFontStyle.textStyle14cCDCDCDRegular400,
                children: [
                  TextSpan(
                    text: 'Tz',
                    style: TextFontStyle.textStyle14c1877F2Regular400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
