import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/custom_text_field.dart';
// import 'login_screen.dart'; // هنحتاجه لما نعمل شاشة اللوجين

class SignUpScreen extends StatefulWidget {
  // الشاشة دي لازم تستقبل "الدور" اللي اختاره المستخدم في الشاشة اللي فاتت
  final String selectedRole; 

  const SignUpScreen({super.key, required this.selectedRole});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers عشان ناخد الداتا اللي المستخدم بيكتبها
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _agreedToTerms = false; // حالة التشيك بوكس بتاع الشروط

  @override
  void dispose() {
    // تنظيف الميموري لما الشاشة تتقفل
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground, // لون رمادي فاتح جداً
      body: SafeArea(
        child: SingleChildScrollView( // عشان الشاشة تنزل وتطلع لو الكيبورد اتفتح
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- زرار الرجوع ---
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
                color: AppColors.textPrimary,
              ),
              SizedBox(height: 32.h),

              // --- العنوان والوصف ---
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Fill your information below or register with your social account.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 40.h),

              // --- حقل الاسم ---
              CustomTextField(
                controller: _nameController,
                hintText: 'Full Name',
                prefixIcon: Icons.person_outline,
              ),
              SizedBox(height: 20.h),

              // --- حقل الإيميل ---
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
                isPassword: true, // عشان تظهر علامة العين ويخفي النص
              ),
              SizedBox(height: 24.h),

              // --- Checkbox شروط الاستخدام ---
              Row(
                children: [
                  Checkbox(
                    value: _agreedToTerms,
                    activeColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _agreedToTerms = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'I agree with the Terms of Service & Privacy Policy',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              // --- زرار التسجيل ---
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _agreedToTerms ? AppColors.primary : AppColors.border,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: _agreedToTerms
                      ? () {
                          // TODO: ربط البيانات بـ Supabase Auth
                          debugPrint("Name: ${_nameController.text}");
                          debugPrint("Email: ${_emailController.text}");
                          debugPrint("Role: ${widget.selectedRole}"); // طبعنا الدور اللي جاي من الشاشة اللي فاتت
                        }
                      : null, // الزرار مقفول لو مش موافق ع الشروط
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: _agreedToTerms ? Colors.white : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // --- رابط تسجيل الدخول ---
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
                      // TODO: الانتقال لشاشة Login
                      debugPrint("Go to Login Screen");
                    },
                    child: Text(
                      'Sign In',
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
}
