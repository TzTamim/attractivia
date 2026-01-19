import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/custom_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import './widget/signature_saved_widget.dart';
import './widget/signature_tips_widget.dart';
import './widget/draw_signature_widget.dart';

class SaveSignature extends StatefulWidget {
  const SaveSignature({super.key});

  @override
  State<SaveSignature> createState() => _SaveSignatureState();
}

class _SaveSignatureState extends State<SaveSignature> {
  Uint8List? exportedSignature;

  void _showSignaturePad() async {
    final signature = await showModalBottomSheet<Uint8List?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Container(
          height: 400.h,
          width: 343.w,
          child: DrawSignatureWidget(),
        );
      },
    );

    if (signature != null) {
      setState(() {
        exportedSignature = signature;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Signature",
          style: TextFontStyle.textStyle20c23243BInterSemiBold600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
        child: Column(
          children: [
            Text(
              "Your chats, documents, and analyses all in one place.",
              style: TextFontStyle.textStyle14c737373InterRegular400,
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpace(42.h),
            if (exportedSignature != null)
              SignatureSavedWidget(signatureData: exportedSignature!),
            if (exportedSignature == null)
              SignatureSavedWidget(signatureData: null),

            UIHelper.verticalSpace(16.h),
            CustomButton(
              onTap: _showSignaturePad,
              btnName: "Create Signature",
              icon: Image.asset(
                Assets.icons.penIcon.path,
                color: AppColors.cFFFFFF,
                height: 24.h,
                width: 24.w,
              ),
            ),
            UIHelper.verticalSpace(6.h),
            CustomButton(
              onTap: () {},
              btnName: "Upload Signature Image",
              bgColor: AppColors.cFFFFFF,
              borderColor: AppColors.cFFFFFF,
              textStyle: TextFontStyle.textStyle18c1877F2InterSemiBold600,
              icon: Image.asset(
                Assets.icons.downloadIcon.path,
                color: AppColors.c1877F2,
                height: 24.h,
                width: 24.w,
              ),
            ),
            UIHelper.verticalSpace(40.h),
            SignatureTipsWidget(),
          ],
        ),
      ),
    );
  }
}
