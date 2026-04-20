import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import 'sign_up_screen.dart'; 

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // غيرنا الخلفية لـ background (أبيض) عشان تماتش الديزاين
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // زرار الرجوع
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back), // غيرنا الأيقونة لشكل أنسب
                color: AppColors.textPrimary,
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 32.h),

              // العنوان الرئيسي (ماشية مع خط الـ Sign up)
              Text(
                'Choose Your Role',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 8.h),
              
              Text(
                'Tell us who you are to personalize your experience.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 48.h),

              // كارت المريض
              _buildRoleCard(
                role: 'patient',
                title: 'Patient',
                description: 'Find doctors, book appointments, and consult online.',
                icon: Icons.person,
              ),
              SizedBox(height: 20.h),

              // كارت الطبيب
              _buildRoleCard(
                role: 'doctor',
                title: 'Doctor',
                description: 'Manage appointments, patients, and your virtual clinic.',
                icon: Icons.medical_services,
              ),

              const Spacer(),

              // زرار المتابعة (بنفس ستايل أزرار التطبيق)
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    // لو مش مختار حاجة، الزرار بياخد لون شفاف شوية
                    disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0, // شيلنا الشادو عشان الزرار يكون Flat زي الديزاين
                  ),
                  onPressed: _selectedRole == null 
                      ? null 
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(selectedRole: _selectedRole!),
                            ),
                          );
                        },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16.sp,
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

  // تصميم الكارت الجديد (Clean & Match UI)
  Widget _buildRoleCard({
    required String role,
    required String title,
    required String description,
    required IconData icon,
  }) {
    final isSelected = _selectedRole == role;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          // لون أزرق فاتح جداً لو مختار، وأبيض لو مش مختار
          color: isSelected ? AppColors.primaryLight : AppColors.background,
          border: Border.all(
            // بوردر أزرق لو مختار، ورمادي فاتح لو لأ
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            // الأيقونة (مربعة بحواف دائرية زي أيقونات التطبيق)
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.background,
                borderRadius: BorderRadius.circular(12.r),
                border: isSelected ? null : Border.all(color: AppColors.border),
              ),
              child: Icon(
                icon,
                size: 24.w,
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 16.w),
            
            // النصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: isSelected ? AppColors.primary.withOpacity(0.8) : AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            
            // الراديو بوتن (شكل الاختيار)
            SizedBox(width: 8.w),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
