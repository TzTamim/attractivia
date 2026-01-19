import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SignatureTipsWidget extends StatelessWidget {
  const SignatureTipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cEFF6FF,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.cBEDBFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tip:', style: TextFontStyle.textStyle14c1877F2Inter700Bold),
          UIHelper.verticalSpace(4.h),
          Text(
            "Your signature should be clear and legible. Use \nyour finger or stylus to draw on the canvas.",
            style: TextFontStyle.textStyle14c1877F2InterRegular400,
          ),
        ],
      ),
    );
  }
}
