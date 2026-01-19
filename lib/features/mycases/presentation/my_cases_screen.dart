import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';

class MyCasesScreen extends StatefulWidget {
  const MyCasesScreen({super.key});

  @override
  State<MyCasesScreen> createState() => _MyCasesScreenState();
}

class _MyCasesScreenState extends State<MyCasesScreen> {
 
  int selectedTab = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(20.h),               
            UIHelper.verticalSpace(24.h),
            Text("My Cases", style: TextFontStyle.textStyle20c23243BInterSemiBold600),
            UIHelper.verticalSpace(4.h),
            Text(
              "Your chats, documents, and analyses all in one place.",
              style: TextFontStyle.textStyle14c737373InterRegular400,
            ),
            
            UIHelper.verticalSpace(24.h),

          
            _buildCustomTabBar(),

            UIHelper.verticalSpace(24.h),

           
            if (selectedTab == 0) _buildConversationsList(),
            if (selectedTab == 1) _buildDocumentsList(),
            if (selectedTab == 2) _buildOCRAnalysisList(),
            
            UIHelper.verticalSpace(50.h),
          ],
        ),
      ),
    );
  }

 
 
  Widget _buildCustomTabBar() {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EFFF),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          _buildTabItem(0, "Conversations"),
          _buildTabItem(1, "Documents"),
          _buildTabItem(2, "OCR Analysis"),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.c1877F2 : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildDocumentsList() {
    return Column(
      children: [
        _buildDocumentCard("Demand Letter", "Nov 18, 2025"),
        _buildDocumentCard("Contract Termination", "Nov 15, 2025"),
      ],
    );
  }

  Widget _buildDocumentCard(String title, String date) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FF),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.description_outlined, color: AppColors.c1877F2, size: 24.sp),
          ),
          UIHelper.horizontalSpace(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextFontStyle.textStyle16c2A2A37SFProRegular400.copyWith(fontWeight: FontWeight.w600)),
                Text("PDF", style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                UIHelper.verticalSpace(4.h),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14.sp, color: AppColors.c1877F2),
                    UIHelper.horizontalSpace(4.w),
                    Text(date, style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                  ],
                ),
              ],
            ),
          ),
      
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            itemBuilder: (BuildContext context) => [
              _buildPopupMenuItem("Edit", Icons.edit_outlined),
              _buildPopupMenuItem("Remove", Icons.delete_outline),
              _buildPopupMenuItem("Download", Icons.file_download_outlined),
              _buildPopupMenuItem("Share", Icons.share_outlined),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String title, IconData icon) {
    return PopupMenuItem(
      value: title,
      child: Row(
        children: [
          Icon(icon, size: 18.sp, color: Colors.black54),
          UIHelper.horizontalSpace(10.w),
          Text(title, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }

  Widget _buildConversationsList() => const Center(child: Text("No Conversations Found"));
  Widget _buildOCRAnalysisList() => const Center(child: Text("No OCR Analysis Data"));
}