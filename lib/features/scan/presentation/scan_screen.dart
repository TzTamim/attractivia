import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/text_font_style.dart';

import '../../../helpers/ui_helpers.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Stack(
        children: [

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                
                    Container(
                      width: 280.w,
                      height: 350.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    UIHelper.verticalSpace(20.h),
                    Text(
                      "Align the document within the frame",
                      style: TextFontStyle.textStyle14c737373InterRegular400.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),

      
          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircleButton(Icons.close, () => Navigator.pop(context)),
                Text(
                  "Scan Document",
                  style: TextFontStyle.textStyle16c2A2A37SFProRegular400.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                _buildCircleButton(Icons.flash_on, () {}),
              ],
            ),
          ),

    
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomAction(Icons.photo_library_outlined, "Gallery"),
                   
                    GestureDetector(
                      onTap: () {
                      
                      },
                      child: Container(
                        height: 70.h,
                        width: 70.h,
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    _buildBottomAction(Icons.picture_as_pdf_outlined, "Import PDF"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20.sp),
      ),
    );
  }

  Widget _buildBottomAction(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28.sp),
        UIHelper.verticalSpace(4.h),
        Text(
          label,
          style: TextFontStyle.textStyle12c737373InterRegular400.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}