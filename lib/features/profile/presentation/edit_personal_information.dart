import 'package:attractivia/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/custom_form_field.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class EditPersonalInformation extends StatefulWidget {
  const EditPersonalInformation({super.key});

  @override
  State<EditPersonalInformation> createState() =>
      _EditPersonalInformationState();
}

class _EditPersonalInformationState extends State<EditPersonalInformation> {
  final TextEditingController _nameController = TextEditingController();

  String selectedCountryCode = "+1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 30.h),
        child: Center(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.cABABAB, width: 2.w),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        Assets.images.profileImage.path,
                        width: 96.w,
                        height: 96.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 14.h,
                    right: -9.5.w,
                    child: Container(
                      padding: EdgeInsets.all(7.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.cFFFFFF,
                        border: Border.all(color: AppColors.cABABAB),
                      ),
                      child: Image.asset(
                        Assets.icons.editIcon.path,
                        color: AppColors.c7B7878,
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(10.h),
              Text(
                "Sarah Ahmed",
                style: TextFontStyle.textStyle18c23243BInterSemiBold600,
              ),
              UIHelper.verticalSpace(28.h),
              Text(
                "Edit Personal Information",
                style: TextFontStyle.textStyle20c23243BInterSemiBold600,
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                "Your chats, documents, and analyses all in \none place.",
                style: TextFontStyle.textStyle14c737373InterRegular400,
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpace(32.h),
              CustomFormField(
                controller: _nameController,
                fillColor: AppColors.cF6F6F6,
                hintText: "Enter full name",
                hintsTextStyle: TextFontStyle.textStyle17c737373InterMedium500,
              ),
              UIHelper.verticalSpace(8.h),
              CustomFormField(
                controller: _nameController,
                fillColor: AppColors.cF6F6F6,
                hintText: "Email Address",
                hintsTextStyle: TextFontStyle.textStyle17c737373InterMedium500,
              ),
              UIHelper.verticalSpace(8.h),
              CustomFormField(
                controller: _nameController,
                fillColor: AppColors.cF6F6F6,
                hintText: "(405) 555-0128",
                hintsTextStyle: TextFontStyle.textStyle17c737373InterMedium500,
                prefixIcon: PopupMenuButton<String>(
                  onSelected: (String value) {
                    setState(() {
                      selectedCountryCode = value;
                    });
                  },
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 80.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  offset: const Offset(0, 50),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: "+1",
                          child: Text("🇺🇸 USA (+1)"),
                        ),
                        const PopupMenuItem<String>(
                          value: "+880",
                          child: Text("🇧🇩 BD (+880)"),
                        ),
                        const PopupMenuItem<String>(
                          value: "+91",
                          child: Text("🇮🇳 IND (+91)"),
                        ),
                      ],
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 8.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectedCountryCode,
                          style: TextFontStyle.textStyle16c23243BInterMedium500,
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 12.sp,
                          color: AppColors.c23243B,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.cF6F6F6,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      "Country / Region",
                      style: TextFontStyle.textStyle17c737373InterMedium500,
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: <String>['Bangladesh', 'India', 'USA'].map((
                      String value,
                    ) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ),
              ),
              UIHelper.verticalSpace(40.h),
              CustomButton(
                onTap: () {},
                btnName: "Save Changes",
                icon: Image.asset(
                  Assets.icons.fileIcon.path,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
