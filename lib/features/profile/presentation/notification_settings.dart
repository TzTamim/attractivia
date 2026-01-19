import 'package:attractivia/features/profile/presentation/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification Settings",
          style: TextFontStyle.textStyle20c23243BInterSemiBold600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Text(
              "Your chats, documents, and analyses \nall in one place.",
              style: TextFontStyle.textStyle14c737373InterRegular400,
            ),
            UIHelper.verticalSpace(36.h),
            NotificationWidget(
              title: "AI Response Notifications",
              subTitle: "Get notified when AI completes your legal question",
            ),
            UIHelper.verticalSpace(16.h),
            NotificationWidget(
              title: "Document Ready Alerts",
              subTitle: "Notification when your PDF document is generated",
            ),
            UIHelper.verticalSpace(16.h),
            NotificationWidget(
              title: "OCR Analysis Completed",
              subTitle: "Alert when document scanning and analysis is done",
            ),
            UIHelper.verticalSpace(16.h),
            NotificationWidget(
              title: "Payment & Subscription Alerts",
              subTitle: "Updates about billing, renewals, and payments",
            ),
            UIHelper.verticalSpace(16.h),
            NotificationWidget(
              title: "General Updates & Announcements",
              subTitle: "News, features, and app updates from AI Legacy",
            ),
            UIHelper.verticalSpace(16.h),
          ],
        ),
      ),
    );
  }
}
