import 'package:attractivia/common/custom_button.dart';
import 'package:attractivia/common/custom_form_field.dart';
import 'package:attractivia/features/auth/preasentation/otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Column(
              children: [
                UIHelper.verticalSpace(157.h),
                  Image.asset(Assets.images.genapplyLogo.path),
                UIHelper.verticalSpace(16.h),
                Text(
                  'Log in',
                  style: TextFontStyle.textStyle24c1A1C1EInterSemiBold600,
                ),
                UIHelper.verticalSpace(8.h),
                Text(
                  'Hello! Welcome, fill your details',
                  style: TextFontStyle.textStyle17c737373InterMedium500,
                ),
                UIHelper.verticalSpace(40.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextFontStyle.textStyle16c3F494DInterMedium500,
                    ),
                    UIHelper.verticalSpace(6.h),
                    CustomFormField(
                      fillColor: AppColors.cF6F6F6,
                      hintText: "Enter your email",
                    ),
                    UIHelper.verticalSpace(24.h),
                    Text(
                      'Password',
                      style: TextFontStyle.textStyle16c3F494DInterMedium500,
                    ),
                    UIHelper.verticalSpace(6.h),
                    CustomFormField(
                      fillColor: AppColors.cF6F6F6,
                      hintText: "Enter password",
                    ),
                    UIHelper.verticalSpace(6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              check= !check;
                            });
                          },
                          icon: Icon(check? Icons.check_box :Icons.check_box_outline_blank ),
                        ),
                        Text(
                          'Remember Me ',
                          style:
                              TextFontStyle.textStyle16c0E0704RobotoRegular400,
                        ),
                        UIHelper.horizontalSpace(30.w),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextFontStyle
                                .textStyle16c0E0704RobotoRegular400
                                .copyWith(color: AppColors.c1877F2),
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(28.h),
                    CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtpVerify()),
                        );
                      },
                      btnName: "Next",
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextFontStyle.textStyle17c696969InterMedium500,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Sign Up',
                        style: TextFontStyle.textStyle17c1877F2InterMedium500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
