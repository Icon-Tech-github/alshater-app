import 'package:alshaatir/screens/sub_category_screen.dart';
import 'package:alshaatir/screens/widgets/bottom_nav_bar.dart';
import 'package:alshaatir/screens/widgets/brand_strip.dart';
import 'package:alshaatir/screens/widgets/category_grid.dart';
import 'package:alshaatir/screens/widgets/header.dart';
import 'package:alshaatir/screens/widgets/horizontal_product_list.dart';
import 'package:alshaatir/screens/widgets/promo_banner.dart';
import 'package:alshaatir/screens/widgets/section_header.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'widgets/floating_cart_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingCartButton(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(searchHint: 'إبحث'),
            const SizedBox(height: 12),
            const PromoBanner(),
            const SizedBox(height: 16),
            SectionHeader(title: 'الأقسام', onTapSeeAll: () {}),
            const SizedBox(height: 10),
            CategoryGrid(
              categories: categories,
              onTap: (category) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubcategoryScreen(category: category),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            SectionHeader(title: 'الشركات', onTapSeeAll: () {}),
            const SizedBox(height: 10),
            const BrandStrip(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'الأكثر مبيعاً'),
            const SizedBox(height: 10),
            HorizontalProductList(
              products: categories
                  .expand((c) => c.subcategories)
                  .expand((s) => s.products)
                  .take(4)
                  .toList(),
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: 'العروض'),
            const SizedBox(height: 10),
            HorizontalProductList(
              products: categories
                  .expand((c) => c.subcategories)
                  .expand((s) => s.products)
                  .skip(2)
                  .take(4)
                  .toList(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
