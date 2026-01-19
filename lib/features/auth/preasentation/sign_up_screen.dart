import 'package:attractivia/common/custom_button.dart';
import 'package:attractivia/common/custom_form_field.dart';
import 'package:attractivia/features/auth/preasentation/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
   
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( 
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form( 
            key: _formKey,
            child: Column(
              children: [
                UIHelper.verticalSpace(20.h),
                Image.asset(Assets.images.genapplyLogo.path),
                UIHelper.verticalSpace(16.h),
                Text(
                  'Sign Up',
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
                      'Full Name',
                      style: TextFontStyle.textStyle16c3F494DInterMedium500,
                    ),
                    UIHelper.verticalSpace(6.h),
                    CustomFormField(
                      controller: _nameController,
                      fillColor: AppColors.cF6F6F6,
                      hintText: "Enter full name",
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Name is required";
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(24.h),
                    Text(
                      'Email',
                      style: TextFontStyle.textStyle16c3F494DInterMedium500,
                    ),
                    UIHelper.verticalSpace(6.h),
                    CustomFormField(
                      controller: _emailController, 
                      fillColor: AppColors.cF6F6F6,
                      hintText: "Enter your email",
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Email is required";
                        if (!value.contains('@')) return "Enter a valid email";
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(24.h),
                    Text(
                      'Password',
                      style: TextFontStyle.textStyle16c3F494DInterMedium500,
                    ),
                    UIHelper.verticalSpace(6.h),
                    CustomFormField(
                      controller: _passwordController, 
                      fillColor: AppColors.cF6F6F6,
                      hintText: "Enter password",
                      isObsecure: true, 
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Password is required";
                        if (value.length < 6) return "Min 6 characters required";
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(24.h),
                    Text(
                      'Confirm Password',
                      style: TextFontStyle.textStyle16c3F494DInterMedium500,
                    ),
                    UIHelper.verticalSpace(6.h),
                    CustomFormField(
                      controller: _confirmPasswordController, 
                      fillColor: AppColors.cF6F6F6,
                      hintText: "Re-enter password",
                      isObsecure: true,
                      validator: (value) {
                        if (value != _passwordController.text) return "Passwords do not match";
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(19.h),
                    CustomButton(
                      onTap: () {
                        
                        if (_formKey.currentState!.validate()) {
                         
                          print("Name: ${_nameController.text}");
                          print("Email: ${_emailController.text}");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogInScreen(),
                            ),
                          );
                        }
                      },
                      btnName: "Next",
                    ),
                  ],
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextFontStyle.textStyle17c696969InterMedium500,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
                        style: TextFontStyle.textStyle17c1877F2InterMedium500,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}