import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import 'category_tile.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories;
  final ValueChanged<Category> onTap;

  const CategoryGrid({
    required this.categories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryTile(
            title: category.name,
            imageUrl: category.imageUrl,
            onTap: () => onTap(category),
          );
        },
      ),
    );
  }
}