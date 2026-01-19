import 'package:attractivia/features/home/presentation/bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attractivia/common/custom_button.dart';
import '../../../constants/text_font_style.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              UIHelper.verticalSpace(157.h),
              Image.asset(Assets.images.genapplyLogo.path),
              UIHelper.verticalSpace(16.h),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) =>
                    LinearGradient(
                      colors: [AppColors.c000000, AppColors.c1877F2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: Text(
                  'GenApply',
                  style: TextFontStyle.textStyle24c1877F2Helvetica700Bold
                      .copyWith(color: Colors.white),
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                'Your AI Lawyer in 15 seconds',
                style: TextFontStyle.textStyle12c737373InterRegular400,
              ),
              UIHelper.verticalSpace(33.h),
              Text(
                'Verify your email address',
                style: TextFontStyle.textStyle24c23243BInterSemiBold600,
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                'Enter the code we’ve sent by text to \nlesliealexander@gmail.com',
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle17c737373InterRegular400,
              ),
              UIHelper.verticalSpace(46.h),

              OtpTextField(
                numberOfFields: 4,
                borderColor: const Color(0xFF1877F2),
                focusedBorderColor: const Color(0xFF1877F2),
                showFieldAsBox: true,
                fieldWidth: 48.w,
                borderRadius: BorderRadius.circular(8),

                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text("Code entered is $verificationCode"),
                      );
                    },
                  );
                },
              ),

              UIHelper.verticalSpace(16.h),
              Text(
                "Didn’t receive OTP?",
                style: TextFontStyle.textStyle15c696969DOnest400,
              ),

              UIHelper.verticalSpace(28.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomScreen()),
                    );
                  },
                  btnName: "Verify",
                ),
              ),
              UIHelper.verticalSpace(20.h),
              Text(
                'Resend code',
                style: TextFontStyle.textStyle17c1877F2InterMedium500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
