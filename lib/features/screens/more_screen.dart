import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'widgets/bottom_nav_bar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _MoreItem('المنتجات المفضلة', Icons.favorite_border),
      _MoreItem('الإشعارات', Icons.notifications_none),
      _MoreItem('العناوين', Icons.location_on_outlined),
      _MoreItem('الدعم', Icons.headset_mic_outlined),
      _MoreItem('الإعدادات', Icons.settings_outlined),
      _MoreItem('الشكاوى', Icons.help_outline),
      _MoreItem('حول التطبيق', Icons.info_outline),
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      body: SingleChildScrollView(
        child: Column(
          children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32)),
            color: Colors.red.shade700,
          ),
          padding: const EdgeInsets.all(
              16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Text("Welcome User",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white))
            ],
          ),
        ),
            const SizedBox(height: 18),
            Container(
              color: Colors.white,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    leading: Icon(item.icon, color: Colors.red.withOpacity(.5)),
                    title: Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 8,),
                itemCount: items.length,
              ),
            ),
            const SizedBox(height: 12),
            _ActionTile(
              title: 'تواصل عبر واتساب',
              icon: Iconsax.whatsapp,
              onTap: () {},
              color: Colors.green,
            ),
            _ActionTile(
              title: 'تابعنا على فيسبوك',
              icon: Iconsax.facebook,
              onTap: () {},
              color: Colors.blue,
            ),
            _ActionTile(
              title: 'شارك التطبيق',
              icon: Iconsax.share,
              onTap: () {},
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'تسجيل خروج',
                    style: TextStyle(color: Colors.red),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red.shade700, width: 1.2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 0),
    );
  }
}

class _MoreItem {
  final String title;
  final IconData icon;

  _MoreItem(this.title, this.icon);
}

class _ActionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;


  const _ActionTile({
    required this.title,
    required this.icon,
    required this.onTap,
   required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: ListTile(
          leading: Icon(icon, color: color),
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          onTap: onTap,
        ),
      ),
    );
  }
}
