import 'package:attractivia/gen/colors.gen.dart';
import 'package:attractivia/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Priche',
          theme: ThemeData(
            primaryColor: AppColors.c1877F2,
            scaffoldBackgroundColor: AppColors.cFFFFFF,

            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.c1877F2,
              selectionColor: Color(0x4D1877F2),
              selectionHandleColor: AppColors.c1877F2,
            ),

            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.cFFFFFF,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.c000000),
              titleTextStyle: TextStyle(color: AppColors.c000000, fontSize: 20),
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: AppColors.c000000),
            ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors.c1877F2,
              secondary: AppColors.c1877F2,
            ),
          ),

          home: const SplashScreen(),
        );
      },
    );
  }
}
