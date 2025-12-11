import 'package:flutter/material.dart';
import 'package:alshaatir/core/app_colors.dart';

class Header extends StatelessWidget {
  final String searchHint;
  final String? userName;
  final String? userImageUrl;

  const Header({
    required this.searchHint,
    this.userName,
    this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.info,
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          // صف الترحيب وصورة المستخدم
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مرحباً، ${userName ?? 'مستخدم'}!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'كيف حالك اليوم؟',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // صورة المستخدم
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 2),
                  color: AppColors.light,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/imeges/logo-alshater.png",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _defaultAvatar();
                      },
                    )
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // شريط البحث
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 44,
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          searchHint,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const Icon(Icons.qr_code_scanner, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Row(
          //   children: [
          //     const Icon(Icons.location_on, color: Colors.white),
          //     const SizedBox(width: 6),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: const [
          //         Text(
          //           'منزلك الحالي',
          //           style: TextStyle(
          //               color: Colors.white, fontWeight: FontWeight.bold),
          //         ),
          //         Text(
          //           'السعودية - الرياض - محطة الفحص الدوري',
          //           style: TextStyle(color: Colors.white70, fontSize: 12),
          //         ),
          //       ],
          //     ),
          //     const Spacer(),
          //     Container(
          //       padding:
          //       const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Text(
          //         'تغيير',
          //         style: TextStyle(
          //             color: Colors.red.shade700, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _defaultAvatar() {
    return Container(
      color: AppColors.light,
      child: const Icon(
        Icons.person,
        color: AppColors.primary,
        size: 30,
      ),
    );
  }
}
