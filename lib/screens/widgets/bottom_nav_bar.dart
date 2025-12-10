import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 4,
      selectedItemColor: Colors.red.shade700,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'المزيد'),
        BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined), label: 'طلباتي'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: 'عربة التسوق'),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined), label: 'العروض'),
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), label: 'الرئيسية'),
      ],
      onTap: (_) {},
    );
  }
}
