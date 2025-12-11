import 'package:alshaatir/features/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../cart_screen.dart';
import '../offers_screen.dart';
import '../orders_screen.dart';
import '../more_screen.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, this.currentIndex = 4});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
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
      onTap: (index) {
        if (index == currentIndex) return;
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MoreScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OrdersScreen()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartScreen()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OffersScreen()),
          );
        }
        else if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
        // index 4 (home) or 0 (more) left as-is.
      },
    );
  }
}
