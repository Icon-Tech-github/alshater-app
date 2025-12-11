import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/default_header.dart';
import 'widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(currentIndex: 0),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Column(
          children: [
            const DefaultHeader(title: 'المنتجات المفضلة', height: 60),
            Expanded(
              child: Consumer<FavoritesProvider>(
                builder: (context, favs, _) {
                  final products = favs.favorites;
                  if (products.isEmpty) {
                    return const Center(
                      child: Text(
                        'لا توجد منتجات مفضلة حالياً',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

