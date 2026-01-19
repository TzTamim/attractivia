import 'package:attractivia/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class ImportanceNoticeWidget extends StatelessWidget {
  const ImportanceNoticeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cFFF7ED,
        border: Border.all(color: AppColors.cFFD6A7),
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Important Notice',
            style: TextFontStyle.textStyle14c9F2D00Inter700Bold,
          ),
          UIHelper.verticalSpace(4.h),
          Text(
            'AI Legacy provides general legal information and document templates. This does not constitute legal advice. For specific legal matters, please consult a licensed attorney.',
            style: TextFontStyle.textStyle14c9F2D00InterRegular400,
          ),
          UIHelper.verticalSpace(16.h),
        ],
      ),
    );
  }
}
