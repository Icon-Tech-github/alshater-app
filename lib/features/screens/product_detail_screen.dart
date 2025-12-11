import 'package:alshaatir/core/app_colors.dart';
import 'package:alshaatir/features/screens/widgets/default_header.dart';
import 'package:alshaatir/features/screens/widgets/floating_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  late final List<String> _sizeOptions;
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
    _sizeOptions = const ['قطعة', 'كرتونة'];
    _selectedSize = _sizeOptions.first;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final cart = context.watch<CartProvider>();
    final cartQty = cart.quantityOf(product.name);
    final displayQty = cartQty > 0 ? cartQty : quantity;
    final unitPrice =
    _selectedSize == 'كرتونة' ? _cartonPrice(product.price) : product.price;
    final price = unitPrice * displayQty;

    return Scaffold(
      floatingActionButton: const FloatingCartButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
             DefaultHeader(title: product.name,height: 60,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product.imageUrl,
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.name,
                    style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.brand,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 18),
                            SizedBox(width: 6),
                            Text('متوفر'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        _selectedSize,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'اختر الحجم',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _sizeOptions
                          .map(
                            (size) {
                          final isCarton = _isCarton(size);
                          final cartonPrice = _cartonPrice(product.price);
                          final optionPrice =
                          isCarton ? cartonPrice : product.price;
                          return Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: _SizeCard(
                              label: size,
                              price: optionPrice,
                              unitPrice: product.price,
                              cartonPrice: cartonPrice,
                              isCarton: isCarton,
                              selected: _selectedSize == size,
                              onTap: () {
                                setState(() {
                                  _selectedSize = size;
                                });
                              },
                            ),
                          );
                        },
                      )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Consumer<CartProvider>(
                    builder: (context, cart, _) {
                      final qty = cart.quantityOf(product.name);
                      if (qty > 0) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
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
                                style:
                                const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () => cart.increment(product.name),
                                icon: const Icon(Icons.add_circle_outline),
                                color: Colors.red.shade700,
                              ),
                            ],
                          ),
                        );
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            for (int i = 0; i < quantity; i++) {
                              cart.addToCart(
                                product,
                                price: unitPrice,
                                sizeLabel: _selectedSize,
                              );
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                Text('تم إضافة $quantity × ${product.name}'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('أضف للسلة'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('الإجمالي',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text(
                        '${price.toStringAsFixed(2)} ج.م ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_shipping_outlined, color: Colors.black54),
                        SizedBox(width: 10),
                        Expanded(
                            child: Text('توصيل سريع ومجاني فوق حد الطلب المحدد')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isCarton(String size) {
    final normalized = size.toLowerCase();
    return normalized.contains('كرت') || normalized.contains('carton');
  }

  double _cartonPrice(double basePrice) => basePrice * 12; // default 12 قطع
}

class _SizeCard extends StatelessWidget {
  final String label;
  final double price;
  final double unitPrice;
  final double cartonPrice;
  final bool isCarton;
  final bool selected;
  final VoidCallback onTap;

  const _SizeCard({
    required this.label,
    required this.price,
    required this.unitPrice,
    required this.cartonPrice,
    required this.isCarton,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 190,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? AppColors.white : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primary : Colors.grey.shade300,
            width: selected ? 1.6 : 1,
          ),
          boxShadow: selected
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                          selected ? AppColors.primary : Colors.transparent,
                          border: Border.all(
                            color: selected
                                ? AppColors.primary
                                : Colors.grey.shade400,
                          ),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              label,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'أقل كمية $label',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12.5,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'جنيه ${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (isCarton)
              Text(
                'سعر القطعة: جنيه ${unitPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
              )
            else
              Text(
                'سعر الكرتونة: جنيه ${cartonPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            const SizedBox(height: 6),
            const Text(
              'الاسعار تشمل ضريبة القيمة المضافة',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

