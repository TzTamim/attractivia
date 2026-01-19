import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:attractivia/features/profile/presentation/edit_personal_information.dart';
import 'package:attractivia/features/profile/presentation/helps_and_support.dart';
import 'package:attractivia/features/profile/presentation/log_out.dart';
import 'package:attractivia/features/profile/presentation/notification_settings.dart';
import 'package:attractivia/features/profile/presentation/save_signature.dart';
import 'package:attractivia/features/profile/presentation/subscriptionstatus.dart';
import 'package:attractivia/features/profile/presentation/terms_and_privacy.dart';
import 'package:attractivia/features/profile/presentation/widget/upgrade_widget.dart';
import 'package:attractivia/features/profile/presentation/widget/profile_menu_item_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LogoutDialog(); 
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(16.h),
            UpgradeWidget(),

           
            ProfileMenuItemWidget(
              icon: Assets.icons.personeIcon.image(height: 24.h, width: 24.w),
              title: "Edit Personal Information",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPersonalInformation(),
                  ),
                );
              },
            ),

         
            ProfileMenuItemWidget(
              icon: Assets.icons.signatureIcon.image(height: 24.h, width: 24.w),
              title: "Saved Signature",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaveSignature()),
                );
              },
            ),

     
            ProfileMenuItemWidget(
              icon: Assets.icons.subcsciptionIcon.image(
                height: 24.h,
                width: 24.w,
              ),
              title: "Subscription Status",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionStatus()),
                );
              },
            ),

          
            ProfileMenuItemWidget(
              icon: Assets.icons.notificationSettingIcon.image(
                height: 24.h,
                width: 24.w,
              ),
              title: "Notification Settings",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationSettings(),
                  ),
                );
              },
            ),

            
            ProfileMenuItemWidget(
              icon: Assets.icons.helpIcon.image(height: 24.h, width: 24.w),
              title: "Help & Support",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpsAndSupport()),
                );
              },
            ),

            
            ProfileMenuItemWidget(
              icon: Assets.icons.termsIcon.image(height: 24.h, width: 24.w),
              title: "Terms & Privacy",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsAndPrivacy()),
                );
              },
            ),

            // Logout
            ProfileMenuItemWidget(
              icon: Assets.icons.logoutIcon.image(height: 24.h, width: 24.w),
              title: "Logout",
              iconColor: AppColors.cDC2626,
              onTap: () {
                _showLogoutDialog(context); 
              },
            ),

            UIHelper.verticalSpace(29.h),
            Center(
              child: Column(
                children: [
                  Text(
                    "AI Legacy v1.0.0",
                    style: TextFontStyle.textStyle16c737373InterRegular400,
                  ),
                  Text(
                    "Powered by HQB",
                    style: TextFontStyle.textStyle16c737373InterRegular400,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(4.h),
          ],
        ),
      ),
    );
  }
}
