import 'package:attractivia/constants/text_font_style.dart';
import 'package:attractivia/gen/colors.gen.dart';
import 'package:attractivia/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? iconConColor;
  final Color? borderColor;
   final TextStyle? titleStyle;
   final TextStyle? subtiTleStyle;
  final Widget icon;
  final bool showBackground;  

  CustomIconContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconConColor,
    required this.icon,
    this.showBackground = true, this.titleStyle, this.subtiTleStyle, this.borderColor, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: showBackground ? AppColors.cEFF6FF : Colors.transparent,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color:borderColor??  AppColors.cEFF6FF)
      ),
      padding:showBackground? EdgeInsets.all(16.w):EdgeInsets.all(0.w) ,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: iconConColor ?? AppColors.cE7F1FF,
              borderRadius: BorderRadius.circular(99.r),
            ),
            child: icon,
          ),
          UIHelper.horizontalSpace(12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle?? TextFontStyle.textStyle16c272727InterRegular400,
              ),
              UIHelper.verticalSpace(4.h),
              Text(
                subtitle,
                style:subtiTleStyle?? TextFontStyle.textStyle13c737373InterRegular400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
