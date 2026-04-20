import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/onboarding_model.dart';
// import 'role_selection_screen.dart'; // هنحتاجه للشاشة اللي جاية

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // للتحكم في الـ PageView (عشان نعرف نقلب الصفحات برمجياً)
  final PageController _pageController = PageController();
  
  // متغير لمعرفة إحنا في أي صفحة حالياً
  int _currentIndex = 0;

  // الداتا بتاعة الشاشات (مؤقتاً بنستخدم أيقونات بدل الصور لحد ما نجهز الـ Assets)
  final List<OnboardingModel> _onboardingData = [
    OnboardingModel(
      image: 'virtual_hospital', // مفروض يكون مسار صورة، حالياً هنستخدم أيقونة تحت
      title: 'Welcome to TeleCare+',
      description: 'Your complete virtual hospital in the palm of your hands. Consult top doctors anytime, anywhere.',
    ),
    OnboardingModel(
      image: 'ai_assistant',
      title: 'AI Medical Assistant',
      description: 'Get instant preliminary triage and answers to your medical queries using our advanced AI.',
    ),
    OnboardingModel(
      image: 'secure_chat',
      title: 'Secure & Private',
      description: 'Your health records and consultations are fully encrypted and private, especially for mental health.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose(); // تنظيف الميموري
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea( // عشان نتجنب النوتش بتاع الموبايل
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            children: [
              // --- زرار Skip ---
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: التوجيه لشاشة الـ Role Selection
                    debugPrint("Skip pressed!");
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),

              // --- الـ PageView (محتوى الشاشات) ---
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index; // تحديث الصفحة الحالية
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // صورة تعبيرية (مؤقتة)
                        Icon(
                          index == 0 ? Icons.local_hospital : 
                          index == 1 ? Icons.smart_toy : Icons.security,
                          size: 200.w,
                          color: AppColors.primary,
                        ),
                        SizedBox(height: 40.h),
                        
                        // العنوان
                        Text(
                          _onboardingData[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        
                        // الوصف
                        Text(
                          _onboardingData[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.textSecondary,
                            height: 1.5, // مسافة بين السطور
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // --- الـ Dots Indicator ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => buildDot(index, context),
                ),
              ),
              SizedBox(height: 32.h),

              // --- زرار Next / Get Started ---
              SizedBox(
                width: double.infinity, // الزرار ياخد العرض كله
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r), // حواف دائرية
                    ),
                  ),
                  onPressed: () {
                    if (_currentIndex == _onboardingData.length - 1) {
                      // لو إحنا في آخر صفحة، نروح للشاشة اللي بعدها
                      // TODO: التوجيه لشاشة الـ Role Selection
                      debugPrint("Get Started pressed!");
                    } else {
                      // لو لسة، نقلب للصفحة اللي بعدها
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentIndex == _onboardingData.length - 1 ? 'Get Started' : 'Next',
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

  // دالة صغيرة لرسم النقط (Dots)
  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // أنيميشن ناعم لما النقطة تتغير
      margin: EdgeInsets.only(right: 8.w),
      height: 8.h,
      width: _currentIndex == index ? 24.w : 8.w, // النقطة الحالية بتكون أطول شوية
      decoration: BoxDecoration(
        color: _currentIndex == index ? AppColors.primary : AppColors.border,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
