import 'package:attractivia/common/custom_icon_container.dart';
import 'package:attractivia/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class KeyPrivacyWidget extends StatelessWidget {
  const KeyPrivacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cEFF6FF.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 13.w, 16.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Text('Key Privacy Highlights',style: TextFontStyle.textStyle16c23243BInter700Bold,),
              UIHelper.verticalSpace(16.h),
          CustomIconContainer(
            title: 'Your Data is Encrypted',
            subtitle: 'All data is encrypted in transit \nand at rest using industry-\nstandard encryption.',
            showBackground: false,
            titleStyle: TextFontStyle.textStyle16c23243BInterRegular400,
            subtiTleStyle: TextFontStyle.textStyle16c737373InterRegular400,
            icon: Image.asset(
              Assets.icons.fileIcon.path,
              color: AppColors.c1877F2,
              height: 24.h,
              width: 24.w,
            ),
          ),
          UIHelper.verticalSpace(12.h),
          CustomIconContainer(
            title: "We Don't Share Your Data",
            subtitle: 'Your personal information and \nlegal matters are never shared \nwith third parties.',
            showBackground: false,
             titleStyle: TextFontStyle.textStyle16c23243BInterRegular400,
            subtiTleStyle: TextFontStyle.textStyle16c737373InterRegular400,
            icon: Image.asset(
              Assets.icons.fileIcon.path,
              color: AppColors.c1877F2,
              height: 24.h,
              width: 24.w,
            ),
          ),
          UIHelper.verticalSpace(12.h),
          CustomIconContainer(
            title: "You Own Your Documents",
            subtitle: 'All generated documents belong \nto you and can be deleted at any \ntime.',
            showBackground: false,
             titleStyle: TextFontStyle.textStyle16c23243BInterRegular400,
            subtiTleStyle: TextFontStyle.textStyle16c737373InterRegular400,
            icon: Image.asset(
              Assets.icons.fileIcon.path,
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
