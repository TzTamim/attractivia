import 'package:attractivia/features/documents/presentation/widget/document_card_widget.dart';
import 'package:attractivia/features/documents/presentation/widget/document_sheet_widget.dart';
import 'package:attractivia/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final List<String> documentTitles = [
    "Official Letter",
    "Contract Termination",
    "Issue Letter",
    "Debt Confirmation",
    "Official Complaint",
    "Payment Agreement",
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(50.h),

            Text(
              'Legal Documents',
              style: TextFontStyle.textStyle20c23243BInterSemiBold600,
            ),

            UIHelper.verticalSpace(4.h),

            Text(
              'Choose a document and get it done instantly', 
              style: TextFontStyle.textStyle14c737373InterRegular400,
            ),

            UIHelper.verticalSpace(16.h),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 20.h),
                itemCount: documentTitles.length,
                itemBuilder: (context, index) {
                  final bool isSelected = _selectedIndex == index;

                  return DocumentCardWidget(
                    title: documentTitles[index],
          
                    bgColor: isSelected
                        ? AppColors.c1877F2.withOpacity(0.5) 
                        : AppColors.c1877F2,

                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return const DocumentSheetWidget();
                        },
                      ).then((value) {
                        setState(() {
                          _selectedIndex = -1;
                        });
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}