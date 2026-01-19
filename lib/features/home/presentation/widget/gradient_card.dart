import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class GradientCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap; 

  const GradientCard({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      clipBehavior: Clip.antiAlias, 
      
   
      child: InkWell(
        onTap: onTap,
        child: Container(
         
          constraints: BoxConstraints(minHeight: 33.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.c3461CB.withValues(alpha: 0.3),
                AppColors.c1877F2.withValues(alpha: 0.06),
              ],
            ),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextFontStyle.textStyle14c1877F2PoppinsMedium500,
          ),
        ),
      ),
    );
  }
}
