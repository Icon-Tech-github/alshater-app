import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alshaatir/core/app_colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../models/category_model.dart';
import '../../providers/cart_provider.dart';
import '../product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
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
              '${product.price.toStringAsFixed(2)} ج.م',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Consumer<CartProvider>(
              builder: (context, cart, _) {
                final qty = cart.quantityOf(product.name);
                if (qty > 0) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => cart.decrement(product.name),
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(
                          '$qty',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () => cart.increment(product.name),
                          icon: const Icon(Icons.add_circle_outline),
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  );
                }
                return SizedBox(
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
                    onPressed: () {
                      context.read<CartProvider>().addToCart(
                        product,
                        price: product.price,
                        sizeLabel: 'قطعة',
                      );
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: 'تم إضافة ${product.name} إلى السلة',
                        ),
                      );
                    },
                    child: const Text('أضف للسلة',
                        style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}