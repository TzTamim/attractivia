import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/custom_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class PremiumCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String priceSubtitle;
  final Color? textColor;
  final Color? btnTextColor;
  final Color? btnBgColor;
  final List<String> features;
  final String buttonText;
  final VoidCallback onButtonTap;
  final String? containerTitle;
  final Color? backgroundColor;
  final Color? borderColor;

  const PremiumCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.priceSubtitle,
    required this.features,
    required this.buttonText,
    required this.onButtonTap,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.btnTextColor,
    this.btnBgColor,
    this.containerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none, 
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.cEFF6FF,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: borderColor ?? AppColors.cDBEAFE,
              width: 1.w,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextFontStyle
                            .textStyle16c23243BInterSemiBold600
                            .copyWith(color: textColor ?? AppColors.cFFFFFF),
                      ),
                      UIHelper.verticalSpace(4.h),
                      Text(
                        subtitle,
                        style: TextFontStyle
                            .textStyle14c23243BInterRegular400
                            .copyWith(color: textColor ?? AppColors.cFFFFFF),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        price,
                        style: TextFontStyle
                            .textStyle29c23243BOnestSemiBold600
                            .copyWith(color: textColor ?? AppColors.cFFFFFF),
                      ),
                      Text(
                        priceSubtitle,
                        style: TextFontStyle
                            .textStyle14c23243BInterMedium500
                            .copyWith(color: textColor ?? AppColors.cFFFFFF),
                      ),
                    ],
                  ),
                ],
              ),

              UIHelper.verticalSpace(24.h),

              ...features.map(
                (feature) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _buildFeatureRow(feature),
                ),
              ),

              UIHelper.verticalSpace(12.h),

              CustomButton(
                onTap: onButtonTap,
                btnName: buttonText,
                borderRadius: 8.r,
                height: 39.h,
                bgColor: btnBgColor,
                borderColor: AppColors.cFFFFFF,
                textStyle: TextFontStyle
                    .textStyle14cFFFFFFInterSemiBold600
                    .copyWith(color: btnTextColor),
              ),
            ],
          ),
        ),

        if (containerTitle != null)
          Positioned(
            
            top: -16.h,
            left: 131.w,
            child: Container(
              padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
              decoration: BoxDecoration(
                color: AppColors.cF59E0B,
                borderRadius: BorderRadius.circular(99.r),
              ),
              child: Text(
                containerTitle!,
                style: TextFontStyle
                    .textStyle14cFFFFFFInterMedium500,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFeatureRow(String feature) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check, size: 18.sp, color: textColor ?? AppColors.cFFFFFF),
        UIHelper.horizontalSpace(10.w),
        Expanded(
          child: Text(
            feature,
            style: TextFontStyle.textStyle14c23243BInterMedium500
                .copyWith(color: textColor ?? AppColors.cFFFFFF),
          ),
        ),
      ],
    );
  }
}
