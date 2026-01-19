import 'package:attractivia/common/custom_icon_container.dart';
import 'package:attractivia/features/profile/presentation/widget/direct_contact_widget.dart';
import 'package:attractivia/features/profile/presentation/widget/support_hour_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class HelpsAndSupport extends StatefulWidget {
  const HelpsAndSupport({super.key});

  @override
  State<HelpsAndSupport> createState() => _HelpsAndSupportState();
}

class _HelpsAndSupportState extends State<HelpsAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help & Support",
          style: TextFontStyle.textStyle20c23243BInterSemiBold600,
        ),
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
                title: 'FAQ & Help Center',
                subtitle: 'Browse common questions and answers',
                icon: Image.asset(
                  Assets.icons.faqIcon.path,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              UIHelper.verticalSpace(16.h),
              CustomIconContainer(
                title: 'Contact Support',
                subtitle: 'Chat with our support team',
                iconConColor: AppColors.cDCFCE7,
                icon: Image.asset(
                  Assets.icons.contactIcon.path,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              UIHelper.verticalSpace(16.h),
              CustomIconContainer(
                title: 'Report a Problem',
                subtitle: 'Let us know about any issues',
                iconConColor: AppColors.cFFE2E2,
                icon: Image.asset(
                  Assets.icons.reportIcon.path,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              UIHelper.verticalSpace(16.h),
              CustomIconContainer(
                title: 'User Guide',
                subtitle: 'Learn how to use AI Legacy',
                iconConColor: AppColors.cF3E8FF,
                icon: Image.asset(
                  Assets.icons.userGideIcon.path,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              UIHelper.verticalSpace(16.h),
              DirectContactWidget(),
              UIHelper.verticalSpace(16.h),
              SupportHourWidget(),
              UIHelper.verticalSpace(97.h),
            ],
          ),
        ),
      ),
    );
  }
}
