import 'package:flutter/material.dart';

import '../../models/category_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.brandImage.isNotEmpty)
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.favorite_border, size: 18),
                ),
              ),
            ),
          Center(
            child: SizedBox(
              height: 70,
              child: Image.network(product.imageUrl, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            product.size,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            'ر.س ${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                minimumSize: const Size.fromHeight(36),
              ),
              onPressed: () {},
              child: const Text(
                'أضف للسلة',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}