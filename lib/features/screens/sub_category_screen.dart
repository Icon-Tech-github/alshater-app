import 'package:alshaatir/features/screens/widgets/header.dart';
import 'package:alshaatir/features/screens/widgets/promo_banner.dart';
import 'package:alshaatir/features/screens/widgets/sub_category_tile.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'brands_products_screen.dart';
import 'widgets/floating_cart_button.dart';

class SubcategoryScreen extends StatelessWidget {
  final Category category;

  const SubcategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingCartButton(),
      body: Column(
        children: [
          // الهيدر ثابت في الأعلى
          Header(searchHint: 'إبحث'),
          // باقي المحتوى قابل للتمرير
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      category.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const PromoBanner(),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: category.subcategories.length,
                      itemBuilder: (context, index) {
                        final sub = category.subcategories[index];
                        return SubCategoryTile(
                          title: sub.name,
                          imageUrl: sub.imageUrl,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    BrandsProductsScreen(subcategory: sub),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}