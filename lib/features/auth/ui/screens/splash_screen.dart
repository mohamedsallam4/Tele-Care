import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
// سنحتاج هذا لاحقاً للانتقال للشاشة التالية
// import 'onboarding_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // دالة للانتظار 3 ثواني ثم الانتقال
  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // حالياً سنقوم فقط بطباعة رسالة في الـ Console
      // لاحقاً سنستبدلها بكود الانتقال الفعلي لـ Onboarding
      debugPrint("🚀 Splash Screen finished. Navigating to next screen...");
      
      /* الكود المستقبلي للانتقال (لا تفعل الـ comment الآن):
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
      */
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold هي الأساس لأي شاشة
    return Scaffold(
      // استخدام اللون الأساسي من ملف الألوان الخاص بنا
      backgroundColor: AppColors.primary, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الأيقونة (مؤقتاً نستخدم أيقونة من Flutter لحين توفر الـ SVG)
            Icon(
              Icons.health_and_safety_outlined,
              size: 100.w, // استخدام .w للتجاوب مع العرض
              color: Colors.white,
            ),
            SizedBox(height: 24.h), // مسافة عمودية متجاوبة
            
            // اسم التطبيق
            Text(
              'TeleCare+',
              style: TextStyle(
                fontSize: 40.sp, // استخدام .sp للتجاوب مع حجم الخط
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2, // مسافة بسيطة بين الحروف لشكل احترافي
              ),
            ),
            SizedBox(height: 8.h),
            
            // الشعار الفرعي (Slogan)
            Text(
              'Your Virtual Hospital',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.8), // لون أبيض مع شفافية 80%
              ),
            ),
          ],
        ),
      ),
    );
  }
}
