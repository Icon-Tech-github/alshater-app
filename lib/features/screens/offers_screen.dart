import 'package:alshaatir/core/app_colors.dart';
import 'package:alshaatir/features/screens/widgets/default_header.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_nav_bar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      {
        'title': 'خصم 20% على الحلويات',
        'subtitle': 'صالح حتى نهاية الشهر',
        'code': 'SWEET20',
      },
      {
        'title': 'توصيل مجاني فوق 100 ر.س',
        'subtitle': 'استخدم الكوبون: FREEDEL',
        'code': 'FREEDEL',
      },
      {
        'title': 'خصم 10 ر.س على أول طلب',
        'subtitle': 'استخدم الكوبون: WELCOME',
        'code': 'WELCOME',
      },
    ];

    return Scaffold(

      body: Column(
        children: [
          const DefaultHeader(title: "العروض",height: 60,),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer['title']!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        offer['subtitle']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Chip(
                            label: Text(offer['code']!),
                            backgroundColor: AppColors.background,
                            labelStyle: TextStyle(color: AppColors.primary),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text('تطبيق'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: offers.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 3),
    );
  }
}

