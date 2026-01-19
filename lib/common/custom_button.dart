import 'package:attractivia/constants/text_font_style.dart';
import 'package:attractivia/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String btnName;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Color? bgColor;
  final Color? borderColor;
  final Color? fontColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final Widget? icon; 

  const CustomButton({
    super.key,
    required this.onTap,
    required this.btnName,
    this.textStyle,
    this.borderRadius,
    this.bgColor,
    this.height,
    this.width,
    this.fontSize,
    this.fontColor,
    this.icon, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 48.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: ShapeDecoration(
          color: bgColor ?? AppColors.c1877F2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            side: BorderSide(
              color: borderColor ?? AppColors.c1877F2,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(width: 8.w),
            ],
            FittedBox(
              child: Text(
                btnName,
                style: textStyle ??
                    TextFontStyle.textStyle18cFFFFFFInterSemiBold600.copyWith(
                      color:fontColor
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  } 
}
