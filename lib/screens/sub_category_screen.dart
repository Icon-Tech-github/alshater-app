import 'package:alshaatir/screens/widgets/header.dart';
import 'package:alshaatir/screens/widgets/promo_banner.dart';
import 'package:alshaatir/screens/widgets/sub_category_tile.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'brands_products_screen.dart';

class SubcategoryScreen extends StatelessWidget {
  final Category category;

  const SubcategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //  const SearchBar(),
          Header(searchHint: 'إبحث'),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(category.name, style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 18),
          const PromoBanner(),
          const SizedBox(height: 50),
          Expanded(
            child: GridView.builder(
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
        ],
      ),
    );
  }
}