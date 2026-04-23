import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_colors.dart';
import 'features/auth/ui/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TeleCareApp());
}

class TeleCareApp extends StatelessWidget {
  const TeleCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // مقاس Figma الافتراضي
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TeleCare+',
          theme: ThemeData(
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            // يمكننا إضافة خط مخصص هنا لاحقاً
          ),
          home: const SplashScreen(), // أول شاشة في التطبيق
        );
      },
    );
  }
}
