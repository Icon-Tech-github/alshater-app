import 'package:alshaatir/features/screens/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';

class HorizontalProductList extends StatelessWidget {
  final List<Product> products;

  const HorizontalProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          return SizedBox(
            width: 160,
            child: ProductCard(product: product),
          );
        },
      ),
    );
  }
}