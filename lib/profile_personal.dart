import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // الألوان الأساسية المطابقة للتصميم
  final Color primaryDarkGreen = const Color(0xFF113814); // لون النصوص الغامقة
  final Color primaryLightGreen = const Color(0xFFAEEA74);
  final Color textGrey = const Color(0xFF8A8A8A);
  final Color bgColor = const Color(0xFFF9FBF9); // لون الخلفية المريح
  final Color borderColor = const Color(0xFFEBEBEB);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // تحديد الاتجاه عربي
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(context),
                const SizedBox(height: 32),
                
                _buildProfileAvatar(),
                const SizedBox(height: 16),
                
                _buildProfileDetails(),
                const SizedBox(height: 40),
                
                // قسم إعدادات الحساب
                _buildSectionTitle('إعدادات الحساب'),
                const SizedBox(height: 12),
                _buildSettingsCard(),
                
                const SizedBox(height: 24),
                
                // قسم الدعم والمساعدة
                _buildSectionTitle('الدعم والمساعدة'),
                const SizedBox(height: 12),
                _buildSupportCard(),
                
                const SizedBox(height: 32),
                
                // زرار تسجيل الخروج
                _buildLogoutButton(),
                
                const SizedBox(height: 40),
                
                // الفوتر (رقم الإصدار)
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1. الهيدر (العنوان وزر الرجوع)
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // مسافة فاضية على الشمال عشان العنوان يفضل في النص بالظبط
        const SizedBox(width: 48), 
        Text(
          'الملف الشخصي',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryDarkGreen,
          ),
        ),
        // زرار الرجوع (موجود على اليمين لأن الاتجاه RTL)
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: bgColor, // لون رمادي/أخضر فاتح جداً
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black87, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  // 2. صورة البروفايل مع أيقونة الكاميرا (Stack)
  Widget _buildProfileAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        // الصورة الأساسية الدائرية
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          // TODO: استبدل بـ NetworkImage لما تربط بالـ API
          child: const Icon(Icons.person, size: 50, color: Colors.white), 
        ),
        // بادج الكاميرا
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: primaryLightGreen,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
          ),
        ),
      ],
    );
  }

  // 3. تفاصيل الطالب (الاسم، الإيميل، الشعبة)
  Widget _buildProfileDetails() {
    return Column(
      children: [
        Text(
          'مجدي عبد الغني',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: primaryDarkGreen,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'ahmed.m@example.com',
          style: TextStyle(
            fontSize: 14,
            color: textGrey,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F9ED), 
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFD9F0C9)), 
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'طالب - علمي رياضة',
                style: TextStyle(
                  color: Color(0xFF2E6B33), 
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.school_outlined, color: Color(0xFF2E6B33), size: 16),
            ],
          ),
        ),
      ],
    );
  }

  // 4. عنوان الأقسام
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textGrey,
        ),
      ),
    );
  }

  // 5. كارت إعدادات الحساب (يحتوي على عنصرين)
  Widget _buildSettingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          _buildMenuItem(
            title: 'البيانات الشخصية',
            icon: Icons.person_outline,
            showDivider: true,
          ),
          _buildMenuItem(
            title: 'الأمان وكلمة المرور',
            icon: Icons.shield_outlined,
            showDivider: false,
          ),
        ],
      ),
    );
  }

  // 6. كارت الدعم والمساعدة
  Widget _buildSupportCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: _buildMenuItem(
        title: 'تواصل مع الدعم',
        icon: Icons.headset_mic_outlined,
        iconBgColor: const Color(0xFFE8F5E9), // خلفية خضراء خفيفة للأيقونة
        iconColor: const Color(0xFF4CAF50),
        showDivider: false,
      ),
    );
  }

  // ويدجت مساعدة لبناء عناصر القائمة (Reusable Menu Item)
  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    bool showDivider = false,
    Color? iconBgColor,
    Color? iconColor,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                // الأيقونة اللي على اليمين
                Container(
                  padding: iconBgColor != null ? const EdgeInsets.all(8) : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: iconBgColor ?? Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? primaryDarkGreen,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                
                // النص
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: primaryDarkGreen,
                    ),
                  ),
                ),
                
                // سهم الدخول اللي على الشمال
                Icon(Icons.arrow_back_ios, color: Colors.grey.shade400, size: 16),
              ],
            ),
          ),
        ),
        // خط فاصل لو فيه عناصر تانية تحتها
        if (showDivider)
          Divider(color: borderColor, height: 1, indent: 16, endIndent: 16),
      ],
    );
  }

  // 7. زرار تسجيل الخروج
  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () {
          // TODO: Logout logic with Cubit
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFF0F0), // خلفية حمراء فاتحة جداً
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        icon: const Icon(Icons.logout, color: Color(0xFFE53935)), // أيقونة الخروج
        label: const Text(
          'تسجيل الخروج',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE53935), 
          ),
        ),
      ),
    );
  }

  // 8. الفوتر
  Widget _buildFooter() {
    return Column(
      children: [
        Text(
          'تطبيق جامعتي',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          'V.1.0.0',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
        ),
      ],
    );
  }
}