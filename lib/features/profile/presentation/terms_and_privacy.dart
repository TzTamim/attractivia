import 'package:attractivia/common/custom_icon_container.dart';
import 'package:attractivia/features/profile/presentation/widget/compliance_standards_widget.dart';
import 'package:attractivia/features/profile/presentation/widget/importance_notice_widget.dart';
import 'package:attractivia/features/profile/presentation/widget/key_privacy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class TermsAndPrivacy extends StatefulWidget {
  const TermsAndPrivacy({super.key});

  @override
  State<TermsAndPrivacy> createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Privacy",
          style: TextFontStyle.textStyle20c23243BInterSemiBold600,
        ),
        backgroundColor: AppColors.cFFFFFF,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Text(
                "Your chats, documents, and analyses all in one \nplace.",
                style: TextFontStyle.textStyle14c737373InterRegular400,
              ),
              UIHelper.verticalSpace(36.h),
              CustomIconContainer(
                title: 'Terms of Service',
                subtitle: 'Legal terms and conditions',
                icon: Image.asset(
                  Assets.icons.faqIcon.path,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              UIHelper.verticalSpace(16.h),
              CustomIconContainer(
                title: 'Privacy Policy',
                subtitle: 'How we handle your data',
                iconConColor: AppColors.cDCFCE7,
                icon: Image.asset(
                  Assets.icons.contactIcon.path,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              UIHelper.verticalSpace(16.h),
              CustomIconContainer(
                title: 'Data Usage & Security',
                subtitle: 'Data protection measures',
                iconConColor: AppColors.cFFE2E2,
                icon: Image.asset(
                  Assets.icons.reportIcon.path,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              UIHelper.verticalSpace(16.h),
             KeyPrivacyWidget(),
              UIHelper.verticalSpace(16.h),
             ComplianceStandardsWidget(),
              UIHelper.verticalSpace(16.h),
              ImportanceNoticeWidget(),
              UIHelper.verticalSpace(97.h),
            ],
          ),
        ),
      ),
    );
  }
}
