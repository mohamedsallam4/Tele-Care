import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/custom_text_field.dart';
// سنحتاج هذا لاحقاً للانتقال لشاشة الـ Home بعد تسجيل الدخول بنجاح
// import '../../home/ui/screens/dashboard_screen.dart'; 
// import 'auth_gateway_screen.dart'; // للانتقال لشاشة إنشاء حساب

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers للداتا المكتوبة
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- زرار الرجوع ---
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                color: AppColors.textPrimary,
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 32.h),

              // --- العنوان والوصف ---
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Please sign in to your account to continue.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 40.h),

              // --- حقل الإيميل (استخدمنا الـ Custom Widget اللي عملناه) ---
              CustomTextField(
                controller: _emailController,
                hintText: 'Email Address',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),

              // --- حقل الباسوورد ---
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              SizedBox(height: 12.h),

              // --- رابط Forgot Password ---
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: الانتقال لشاشة نسيان كلمة المرور
                    debugPrint("Forgot Password clicked");
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              // --- زرار Sign In ---
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
                    // TODO: ربط تسجيل الدخول بـ Supabase 
                    // وبعد النجاح الانتقال للـ Home
                    debugPrint("Login clicked with: ${_emailController.text}");
                    /*
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardScreen()),
                    );
                    */
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              // --- فاصل "or" ---
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

              // --- أزرار التسجيل السريع (Social Login) ---
              _buildSocialLoginButton(
                icon: Icons.g_mobiledata, // جوجل
                title: 'Continue with Google',
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              _buildSocialLoginButton(
                icon: Icons.apple, // أبل
                title: 'Continue with Apple',
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              _buildSocialLoginButton(
                icon: Icons.facebook, // فيسبوك
                title: 'Continue with Facebook',
                onPressed: () {},
              ),
              SizedBox(height: 32.h),

              // --- رابط إنشاء حساب (Sign up) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // نرجع خطوة ورا عشان يختار الدور من جديد (أو نوديه لـ AuthGatewayScreen)
                      Navigator.pop(context);
                      // TODO: لو عاوز توديه بوابة التسجيل علطول استخدم الكود ده بعد ماتعمل import:
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthGatewayScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // --- دالة مساعدة لزر الـ Social Login ---
  // نقلناها هنا عشان مانكتبش الكود 3 مرات
  Widget _buildSocialLoginButton({
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.border, width: 1),
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
