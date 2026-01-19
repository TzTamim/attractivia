import 'package:attractivia/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class DocumentCardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color bgColor;

  const DocumentCardWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cF8FBFF,
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
          
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.cE7F1FF,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Image.asset(
                Assets.icons.fileIcon.path,
                height: 24.h,
                width: 24.w,
                color: AppColors.c1877F2,
              ),
            ),
            UIHelper.horizontalSpace(12.w), 
            
            Expanded(
              child: Text(
                title,
                style: TextFontStyle.textStyle16c23243BInterRegular400,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            
            CustomButton(
              bgColor: bgColor,
              onTap: onTap,
              btnName: "Generate Now",
              borderRadius: 8.r,
              height: 36.h, 
              width: 110.w,
              textStyle: TextFontStyle.textStyle12cFFFFFFInterSemiBold600,
            ),
          ],
        ),
      ),
    );
  }
}