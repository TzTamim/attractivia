import 'package:attractivia/features/profile/presentation/subscriptionstatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class UpgradeWidget extends StatelessWidget {
  const UpgradeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFD1D6F9), Color(0xFF6B48FF)],
            ),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: AppColors.c000DFF.withValues(alpha: .10),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],

            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upgrade to Premium",
                    style: TextFontStyle.textStyle16c2A2A37SFProRegular400
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Unlock unlimited features",
                    style: TextFontStyle.textStyle12c737373InterRegular400,
                  ),
                  UIHelper.verticalSpace(12.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubscriptionStatus(),
                        ),
                      );
                    },
                    child: Container(
                      height: 36.h,
                      width: 102.w,
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.c000DFF.withValues(alpha: .10),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Assets.icons.upgradeIcon.image(
                                height: 16,
                                width: 16,
                              ),
                            ),

                            Text(
                              'Upgrade',
                              style: TextFontStyle
                                  .textStyle14c1877F2InterSemiBold600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 80,
          bottom: 3,
          child: Image.asset(Assets.images.line.path),
        ),
        Positioned(
          right: 10,
          child: SizedBox(
            height: 112.h,
            width: 112.w,
            child: Image.asset(Assets.images.premium.path)
          ),
        ),
      ],
    );
  }
}
