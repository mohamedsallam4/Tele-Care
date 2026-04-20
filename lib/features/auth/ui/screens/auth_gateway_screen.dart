import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthGatewayScreen extends StatelessWidget {
  const AuthGatewayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              // --- الشعار واسم التطبيق ---
              Icon(
                Icons.health_and_safety,
                size: 80.w,
                color: AppColors.primary,
              ),
              SizedBox(height: 16.h),
              Text(
                'TeleCare+',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 40.h),

              // --- العنوان الترحيبي ---
              Text(
                "Let's get started!",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 32.h),

              // --- أزرار التسجيل السريع (Social Login) ---
              // سنضعها في Column لترتيبها عمودياً كما في التصميم
              _buildSocialButton(
                context,
                icon: Icons.g_mobiledata, // أيقونة مؤقتة لجوجل
                title: 'Continue with Google',
                onPressed: () {
                  // TODO: إضافة منطق تسجيل الدخول بجوجل عبر Supabase
                  debugPrint("Google login pressed");
                },
              ),
              SizedBox(height: 16.h),
              _buildSocialButton(
                context,
                icon: Icons.apple, // أيقونة مؤقتة لأبل
                title: 'Continue with Apple',
                onPressed: () {
                  // TODO: إضافة منطق تسجيل الدخول بأبل
                },
              ),
              SizedBox(height: 16.h),
              _buildSocialButton(
                context,
                icon: Icons.facebook, // أيقونة مؤقتة لفيسبوك
                title: 'Continue with Facebook',
                onPressed: () {
                  // TODO: إضافة منطق تسجيل الدخول بفيسبوك
                },
              ),
              SizedBox(height: 32.h),

              // --- فاصل (Divider) "OR" ---
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.border, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.border, thickness: 1)),
                ],
              ),
              SizedBox(height: 32.h),

              // --- زر التسجيل بالبريد الإلكتروني ---
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    // الانتقال إلى شاشة اختيار الدور (Role Selection) كخطوة أولى في التسجيل اليدوي
                    // TODO: فك التعليق عند ربط الشاشات
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
                    );
                    */
                    debugPrint("Sign up with email pressed");
                  },
                  child: Text(
                    'Sign up with email',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // --- رابط الانتقال لشاشة تسجيل الدخول (Login) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // الانتقال لشاشة Login
                      // TODO: فك التعليق عند إنشاء شاشة Login
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                      */
                      debugPrint("Navigate to Login Screen");
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- دالة مساعدة لبناء أزرار الـ Social Login بشكل متكرر ونظيف ---
  Widget _buildSocialButton(BuildContext context, {required IconData icon, required String title, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.border, width: 1), // إطار رمادي
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          backgroundColor: AppColors.background,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24.w, color: AppColors.textPrimary),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
