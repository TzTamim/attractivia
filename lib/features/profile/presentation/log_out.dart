import 'package:attractivia/features/auth/preasentation/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'package:attractivia/common/custom_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 224.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(16.w),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                Assets.icons.logoutIcon.path,
                height: 44.h,
                width: 44.w,
              ),
              UIHelper.verticalSpace(16.h),
              Divider(color: AppColors.cD1D5DC, thickness: 1, height: 1),
              UIHelper.verticalSpace(16.h),
              Text(
                'Are you sure you want to \nlog out?',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle20c23243BInterSemiBold600
                    .copyWith(fontWeight: FontWeight.w500),
              ),

              UIHelper.verticalSpace(16.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      height: 40.h,
                      onTap: () {
                        Navigator.pop(context);
                      },

                      btnName: "Cancel",
                      bgColor: AppColors.cFFFFFF,
                      textStyle:
                          TextFontStyle.textStyle14c23243BInterSemiBold600,
                    ),
                  ),
                  UIHelper.horizontalSpace(12.w),
                  Expanded(
                    child: CustomButton(
                      height: 40.h,
                      onTap: () {
                         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen()),
                );
                      },
                      textStyle:
                          TextFontStyle.textStyle14cFFFFFFInterSemiBold600,
                      btnName: "Yes, Logout",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
