import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;

  const ProfileMenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Card(
        elevation: 0,
        color: AppColors.cE0EEFF.withValues(alpha: 0.40),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Padding(
          padding: EdgeInsets.all(13.w),
          child: Row(
            children: [
              SizedBox(height: 22.sp, width: 22.sp, child: icon),

              UIHelper.horizontalSpace(12.w),

              Expanded(
                child: Text(
                  title,
                  style: TextFontStyle.textStyle16c23243BInterRegular400
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14.sp,
                color: AppColors.c23243B,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
