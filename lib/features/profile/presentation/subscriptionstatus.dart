import 'package:attractivia/features/profile/presentation/widget/premium_card_widget.dart';
import 'package:attractivia/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/ui_helpers.dart';

class SubscriptionStatus extends StatefulWidget {
  const SubscriptionStatus({super.key});

  @override
  State<SubscriptionStatus> createState() => _SubscriptionStatusState();
}

class _SubscriptionStatusState extends State<SubscriptionStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 70.h,
                width: 70.w,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.c1877F2,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Assets.icons.unlocePremiumIcon.image(
                  height: 34.h,
                  width: 44.w,
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                "Unlock Premium Features",
                style: TextFontStyle.textStyle20c23243BInterSemiBold600,
              ),

              UIHelper.verticalSpace(8.h),

              Text(
                "Get access to advanced tools, unlimited cases, and \npriority support to maximize your productivity",
                style: TextFontStyle.textStyle12c23243BInterRegular400,
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpace(16.h),

              PremiumCardWidget(
                title: "Pay per Case",
                subtitle: "Perfect for one-time use",
                price: "\$19",
                priceSubtitle: "1 Single Case",
                features: [
                  "Immediate access to premium tools",
                  "No recurring charges",
                  "Complete case analysis",
                ],
                textColor: AppColors.c23243B,
                buttonText: "Get Started",
                onButtonTap: () {},
              ),
              UIHelper.verticalSpace(19.w),
              PremiumCardWidget(
                title: 'Monthly Plan',
                subtitle: 'Great for regular users',
                price: "\$9",
                priceSubtitle: 'per month',
                features: [
                  "Up to 3 cases per month",
                  "Monthly flexibility",
                  "Cancel anytime",
                  "Priority email support",
                ],
                containerTitle: "Most Flexible",
                buttonText: 'Choose Monthly',
                onButtonTap: () {},
                backgroundColor: AppColors.c4CA0FF,
                btnBgColor: AppColors.cFFFFFF,
                btnTextColor: AppColors.c000000,
              ),
              UIHelper.verticalSpace(19.w),
              PremiumCardWidget(
                title: 'Annual Plan',
                subtitle: 'Save 29% with yearly billing',
                price: "\$79",
                priceSubtitle: 'per year',
                features: [
                  "Unlimited access to all cases",
                  "All prernium features included",
                  "Priority support & chat",
                  "Advanced analytics dashboard",
                  "Export & sharing capabilities",
                ],
                containerTitle: "Best Value",
                buttonText: 'Upgrade Now',
                onButtonTap: () {},
                backgroundColor: AppColors.c1877F2,
                btnBgColor: AppColors.cFFFFFF,
                btnTextColor: AppColors.c000000,
              ),
              UIHelper.verticalSpace(20.w),
            ],
          ),
        ),
      ),
    );
  }
}
