import 'package:attractivia/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/custom_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class GenerateDialoge extends StatefulWidget {
  final String date,
      name,
      address,
      recipientName,
      recipientAddress,
      subject,
      details;

  const GenerateDialoge({
    super.key,
    required this.date,
    required this.name,
    required this.address,
    required this.recipientName,
    required this.recipientAddress,
    required this.subject,
    required this.details,
  });

  @override
  State<GenerateDialoge> createState() => _GenerateDialogeState();
}

class _GenerateDialogeState extends State<GenerateDialoge> {
  bool isDownloading = false;

  Future<void> _startDownload() async {
    setState(() {
      isDownloading = true;
    });

    // ⏳ Fake download delay
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isDownloading = false;
    });

    // ✅ Success dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48.sp,
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                "Download Successful",
                style: TextFontStyle
                    .textStyle16c23243BInterSemiBold600,
              ),
              UIHelper.verticalSpace(6.h),
              Text(
                "Your PDF file has been downloaded successfully.",
                textAlign: TextAlign.center,
                style: TextFontStyle
                    .textStyle12c737373InterRegular400,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 100.h),
      child: Column(
        children: [
          UIHelper.verticalSpace(20.h),

         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIHelper.horizontalSpace(20.w),
              Text(
                "Document Preview",
                style:
                    TextFontStyle.textStyle20c23243BInterSemiBold600,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: AppColors.c23243B,
                  size: 16.sp,
                ),
              ),
            ],
          ),  
          Expanded(
            child: SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.all(24.w),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Date: ${widget.date}',
                          style: TextFontStyle
                              .textStyle14c23243BInterRegular400,
                        ),
                      ),

                      Text(
                        'To: ${widget.recipientName}',
                        style: TextFontStyle
                            .textStyle14c23243BInterRegular400,
                      ),
                      Text(
                        widget.recipientAddress,
                        style: TextFontStyle
                            .textStyle14c23243BInterRegular400,
                      ),

                      UIHelper.verticalSpace(10.h),

                      Text(
                        'Subject: ${widget.subject}',
                        style: TextFontStyle
                            .textStyle14c23243BInterRegular400,
                      ),

                      Text(
                        'Dear Sir/Madam,',
                        style: TextFontStyle
                            .textStyle14c23243BInterRegular400,
                      ),

                      UIHelper.verticalSpace(16.h),

                      Text(
                        widget.details.isEmpty
                            ? 'This document has been automatically generated based on your requirements.'
                            : widget.details,
                        style: TextFontStyle
                            .textStyle14c23243BInterRegular400,
                      ),

                      UIHelper.verticalSpace(16.h),

                      Text(
                        'Sincerely,',
                        style: TextFontStyle
                            .textStyle14c23243BInterRegular400,
                      ),
                      Text(
                        widget.name,
                        style: TextFontStyle
                            .textStyle14c23243BInterRegular400,
                      ),
                      Text(
                        widget.address,
                        style: TextFontStyle
                            .textStyle12c737373InterRegular400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// 🔹 Download Button / Loader
          Padding(
            padding: EdgeInsets.all(16.w),
            child: isDownloading
                ? SizedBox(
                    height: 33.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.c1877F2,
                      ),
                    ),
                  )
                : CustomButton(
                    onTap: _startDownload,
                    btnName: "Download PDF",
                    height: 33.h,
                    icon: Image.asset(
                      Assets.icons.downloadIcon.path,
                      width: 16.w,
                    ),
                    textStyle: TextFontStyle
                        .textStyle12cFFFFFFInterSemiBold600,
                  ),
          ),
        ],
      ),
    );
  }
}
