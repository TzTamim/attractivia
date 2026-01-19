import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class NotificationWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  NotificationWidget({super.key, required this.title, required this.subTitle});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 16.w, 16.h, 19.h),
      decoration: BoxDecoration(
        color: AppColors.cEFF6FF,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                 widget.title,
                  style: TextFontStyle.textStyle16c23243BInterRegular400,
                ),
                UIHelper.verticalSpace(4.h),
                Text(
                  widget.subTitle,
                  style: TextFontStyle.textStyle14c737373InterRegular400,
                ),
              ],
            ),
          ),

          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: AppColors.c1877F2,
            inactiveTrackColor: AppColors.cD1D5DC,
          ),
        ],
      ),
    );
  }
}
