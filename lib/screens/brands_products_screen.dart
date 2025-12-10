import 'package:alshaatir/screens/widgets/header.dart';
import 'package:alshaatir/screens/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'widgets/floating_cart_button.dart';

class BrandsProductsScreen extends StatefulWidget {
  final Subcategory subcategory;

  const BrandsProductsScreen({super.key, required this.subcategory});

  @override
  State<BrandsProductsScreen> createState() => _BrandsProductsScreenState();
}

class _BrandsProductsScreenState extends State<BrandsProductsScreen> {
  String selectedBrand = 'الكل';

  @override
  Widget build(BuildContext context) {
    final brandEntries = <String, String>{};
    for (final p in widget.subcategory.products) {
      brandEntries[p.brand] = p.brandImage;
    }
    final brands = [
      const Brand(name: 'الكل', imageUrl: ''),
      ...brandEntries.entries
          .map((e) => Brand(name: e.key, imageUrl: e.value))
          .toList(),
    ];

    final products = widget.subcategory.products
        .where((p) => selectedBrand == 'الكل' ? true : p.brand == selectedBrand)
        .toList();

    return Scaffold(
      floatingActionButton: const FloatingCartButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(searchHint: 'إبحث'),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.subcategory.name, style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final brand = brands[index];
                  final isSelected = brand.name == selectedBrand;
                  return ChoiceChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (brand.imageUrl.isNotEmpty)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                brand.imageUrl,
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        Text(brand.name),
                      ],
                    ),
                    selected: isSelected,
                    onSelected: (_) =>
                        setState(() => selectedBrand = brand.name),
                    selectedColor: Colors.red.shade100,
                    side: BorderSide(
                      color: isSelected
                          ? Colors.red.shade700
                          : Colors.grey.shade300,
                    ),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.red.shade700 : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 8),
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
            ),
          ),
        ],
      ),
    );
  }
}