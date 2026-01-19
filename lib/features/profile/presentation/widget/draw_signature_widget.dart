import 'package:attractivia/common/custom_button.dart';
import 'package:attractivia/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signature/signature.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class DrawSignatureWidget extends StatefulWidget {
  const DrawSignatureWidget({super.key});

  @override
  State<DrawSignatureWidget> createState() => _DrawSignatureWidgetState();
}

class _DrawSignatureWidgetState extends State<DrawSignatureWidget> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Draw Your Signature",
            style: TextFontStyle.textStyle16c23243BInterSemiBold600,
          ),
          UIHelper.verticalSpace(16.h),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.cD9D9D9.withValues(alpha: 0.40),
                width: 0.5.r,
              ),
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.c737373.withValues(alpha: 0.20),
            ),
            child: Signature(
              controller: _controller,
              height: 200.h,
              backgroundColor: Colors.transparent,
            ),
          ),
          UIHelper.verticalSpace(20.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () => _controller.clear(),
                  btnName: "Clear",
                  icon: Image.asset(
                    Assets.icons.clearIcon.path,
                    height: 16.h,
                    width: 16.w,
                  ),
                  borderRadius: 8.r,
                  textStyle: TextFontStyle.textStyle14c23243BInterSemiBold600,
                  bgColor: AppColors.cFFFFFF,
                  borderColor: AppColors.c737373.withValues(alpha: 0.60),
                ),
              ),

              UIHelper.horizontalSpace(10.w),
              Expanded(
                child: CustomButton(
                  onTap: () async {
                    if (_controller.isNotEmpty) {
                      final data = await _controller.toPngBytes();
                      Navigator.pop(context, data);
                    }
                  },
                  btnName: "Save",
                  borderRadius: 8.r,
                  textStyle: TextFontStyle.textStyle14cFFFFFFInterSemiBold600,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextFontStyle.textStyle14c23243BInterMedium500,
            ),
          ),
          UIHelper.verticalSpace(20.h),
        ],
      ),
    );
  }
}
