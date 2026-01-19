import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SignatureSavedWidget extends StatelessWidget {
  final Uint8List? signatureData; 

  const SignatureSavedWidget({super.key, this.signatureData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(13.w, 24.h, 13.w, 24.h),
      decoration: BoxDecoration(
        color: AppColors.cEFF6FF,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: signatureData != null
          ? Image.memory(signatureData!, height: 150.h)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColors.cE3ECFF,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Image.asset(
                    Assets.icons.penIcon.path,
                    height: 41.h,
                    width: 41.w,
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                Text(
                  "No Signature Saved",
                  style: TextFontStyle.textStyle16c23243BInter700Bold,
                ),
                UIHelper.verticalSpace(4.h),
                Text(
                  "Create your signature to use in legal documents",
                  style: TextFontStyle.textStyle14c737373InterRegular400,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
    );
  }
}