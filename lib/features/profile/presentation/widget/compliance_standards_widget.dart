import 'package:attractivia/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class ComplianceStandardsWidget extends StatelessWidget {
  const ComplianceStandardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cEFF6FF,
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Compliance & Standards',
            style: TextFontStyle.textStyle16c23243BInter700Bold,
          ),
          UIHelper.verticalSpace(16.h),
          Row(
            children: [
              Image.asset(
                Assets.icons.complianceIcon.path,
                height: 8.h,
                width: 8.w,
              ),
              UIHelper.horizontalSpace(8.h),
              Text(
                'GDPR Compliant',
                style: TextFontStyle.textStyle14c23243BInterRegular400,
              ),
            ],
          ),
          UIHelper.verticalSpace(8.h),
          Row(
            children: [
              Image.asset(
                Assets.icons.complianceIcon.path,
                height: 8.h,
                width: 8.w,
              ),
              UIHelper.horizontalSpace(8.h),
              Text(
                'CCPA Compliant',
                style: TextFontStyle.textStyle14c23243BInterRegular400,
              ),
            ],
          ),
          UIHelper.verticalSpace(8.h),
          Row(
            children: [
              Image.asset(
                Assets.icons.complianceIcon.path,
                height: 8.h,
                width: 8.w,
              ),
              UIHelper.horizontalSpace(8.h),
              Text(
                'SOC 2 Type II Certified',
                style: TextFontStyle.textStyle14c23243BInterRegular400,
              ),
            ],
          ),
          UIHelper.verticalSpace(8.h),
          Row(
            children: [
              Image.asset(
                Assets.icons.complianceIcon.path,
                height: 8.h,
                width: 8.w,
              ),
              UIHelper.horizontalSpace(8.h),
              Text(
                'ISO 27001 Certified',
                style: TextFontStyle.textStyle14c23243BInterRegular400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
