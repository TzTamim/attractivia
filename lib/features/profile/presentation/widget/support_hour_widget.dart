import 'package:attractivia/common/custom_icon_container.dart';
import 'package:attractivia/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SupportHourWidget extends StatelessWidget {
  const SupportHourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cEFF6FF.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 13.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support Hours',
            style: TextFontStyle.textStyle16c1877F2Inter700Bold,
          ),
          UIHelper.verticalSpace(16.h),
          CustomIconContainer(
            title: 'Monday - Friday:',
            subtitle: '9:00 AM - 8:00 PM EST',
            showBackground: false,
            titleStyle: TextFontStyle.textStyle16c23243BInterRegular400,
            subtiTleStyle: TextFontStyle.textStyle16c1877F2InterRegular400,
            icon: Image.asset(
              Assets.icons.timerIcon.path,
              color: AppColors.c1877F2,
              height: 24.h,
              width: 24.w,
            ),
          ),
          UIHelper.verticalSpace(12.h),
          CustomIconContainer(
            title: 'Saturday - Sunday:',
            subtitle: '10:00 AM - 6:00 PM EST',
            showBackground: false,
            titleStyle: TextFontStyle.textStyle16c23243BInterRegular400,
            subtiTleStyle: TextFontStyle.textStyle16c1877F2InterRegular400,
            icon: Image.asset(
              Assets.icons.timerIcon.path,
              color: AppColors.c1877F2,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
