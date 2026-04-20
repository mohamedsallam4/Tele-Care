import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
// سنحتاج هذا لاحقاً للانتقال إلى الشاشة الرئيسية (Dashboard)
// import '../../home/ui/screens/dashboard_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // SafeArea هنا تضمن عدم تداخل المحتوى مع شريط الحالة في الأعلى
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // وضع المحتوى في منتصف الشاشة
            children: [
              const Spacer(), // يدفع المحتوى للأسفل قليلاً

              // --- أيقونة النجاح ---
              // نستخدم AnimatedContainer لإعطاء تأثير ظهور ناعم (مستقبلاً يمكن إضافة أنيميشن كامل)
              Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1), // لون أزرق فاتح جداً للخلفية
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check, // علامة الصح
                      size: 40.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              // --- العنوان ---
              Text(
                'Success!',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 16.h),

              // --- الوصف ---
              Text(
                'Your account has been successfully created. You can now start using TeleCare+.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),

              const Spacer(), // يدفع الزر للأسفل

              // --- زر الانتقال للرئيسية ---
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
                    // الانتقال إلى الشاشة الرئيسية (Dashboard)
                    // نستخدم pushAndRemoveUntil لمنع المستخدم من العودة لشاشة النجاح أو التسجيل عبر زر الرجوع (Back Button)
                    
                    // TODO: فك التعليق عند إنشاء شاشة الـ Dashboard
                    /*
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardScreen()),
                      (route) => false, // يحذف كل الشاشات السابقة من الـ Stack
                    );
                    */
                    debugPrint("Go to Home pressed");
                  },
                  child: Text(
                    'Go to Home',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
