import 'package:attractivia/common/custom_button.dart';
import 'package:attractivia/constants/text_font_style.dart';
import 'package:attractivia/features/documents/presentation/widget/generate_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/custom_form_field.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class DocumentSheetWidget extends StatefulWidget {
  const DocumentSheetWidget({super.key});

  @override
  State<DocumentSheetWidget> createState() => _DocumentSheetWidgetState();
}

class _DocumentSheetWidgetState extends State<DocumentSheetWidget> {

  final TextEditingController _dateController = TextEditingController(text: "11/20/2025");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _recipientNameController = TextEditingController();
  final TextEditingController _recipientAddressController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    
    _dateController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _recipientNameController.dispose();
    _recipientAddressController.dispose();
    _subjectController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
      child: Column(
        children: [
          UIHelper.verticalSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIHelper.horizontalSpace(20.w),
              Text(
                "Document Preview",
                style: TextFontStyle.textStyle20c23243BInterSemiBold600,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: AppColors.c23243B, size: 16.sp),
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
                      Text(
                        "Document Details",
                        style: TextFontStyle.textStyle14c23243BInterSemiBold600,
                      ),
                      _buildLabel("Date"),
                      CustomFormField(
                        controller: _dateController, 
                        hintText: "11/20/2025",
                        fillColor: const Color(0xFFF7F7F7),
                        hintsTextStyle: TextFontStyle.textStyle12c737373InterRegular400,
                      ),

                      _buildLabel("Your Name"),
                      CustomFormField(
                        controller: _nameController,
                        hintText: "John Doe",
                        fillColor: const Color(0xFFF7F7F7),
                        hintsTextStyle: TextFontStyle.textStyle12c737373InterRegular400,
                      ),

                      _buildLabel("Your Address"),
                      CustomFormField(
                        controller: _addressController,
                        hintText: "123 Main Street, City",
                        fillColor: const Color(0xFFF7F7F7),
                        hintsTextStyle: TextFontStyle.textStyle12c737373InterRegular400,
                      ),

                      _buildLabel("Topic Name"),
                      CustomFormField(
                        controller: _recipientNameController,
                        hintText: "Jane Smith",
                        fillColor: const Color(0xFFF7F7F7),
                        hintsTextStyle: TextFontStyle.textStyle12c737373InterRegular400,
                      ),

                      _buildLabel("Recipient Address"),
                      CustomFormField(
                        controller: _recipientAddressController,
                        hintText: "456 Oak Avenue, City",
                        fillColor: const Color(0xFFF7F7F7),
                        hintsTextStyle: TextFontStyle.textStyle12c737373InterRegular400,
                      ),

                      _buildLabel("Subject*"),
                      CustomFormField(
                        controller: _subjectController,
                        hintText: "Re: Payment Demand",
                        fillColor: const Color(0xFFF7F7F7),
                        hintsTextStyle: TextFontStyle.textStyle12c737373InterRegular400,
                      ),

                      _buildLabel("Additional Details"),
                      CustomFormField(
                        controller: _detailsController,
                        hintText: "Provide specific details about your application...",
                        maxline: 4,
                        fillColor: const Color(0xFFF7F7F7),
                        hintsTextStyle: TextFontStyle.textStyle12c737373InterRegular400,
                      ),
                      UIHelper.verticalSpace(16.h),
                      CustomButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                           
                              return GenerateDialoge(
                                date: _dateController.text,
                                name: _nameController.text,
                                address: _addressController.text,
                                recipientName: _recipientNameController.text,
                                recipientAddress: _recipientAddressController.text,
                                subject: _subjectController.text,
                                details: _detailsController.text,
                              );
                            },
                          );
                        },
                        btnName: "Generate Now",
                        height: 33.h,
                        textStyle: TextFontStyle.textStyle12cFFFFFFInterSemiBold600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextFontStyle.textStyle14c23243BInterMedium500,
          children: const [
            TextSpan(
              text: ' *',
              style: TextStyle(color: AppColors.cFF0000),
            ),
          ],
        ),
      ),
    );
  }
}