import 'package:alshaatir/core/app_colors.dart';
import 'package:alshaatir/features/screens/widgets/default_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/bottom_nav_bar.dart';
import '../providers/cart_provider.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(currentIndex: 2),
      body: Column(
        children: [
          // HEADER ثابت
          const DefaultHeader(title: 'السلة',height: 60,),

          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cart, _) {
                // سلة فارغة
                if (cart.items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.shopping_cart_outlined,
                            size: 64, color: Colors.grey),
                        const SizedBox(height: 12),
                        const Text('السلة فارغة حالياً'),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 12),
                          ),
                          child: const Text('عودة للتسوق'),
                        ),
                      ],
                    ),
                  );
                }

                // السلة تحتوي منتجات
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return Dismissible(
                            key: ValueKey(item.product.name),
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) => cart.remove(item.product.name),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      item.product.imageUrl,
                                      height: 64,
                                      width: 64,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.product.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item.product.size,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          '${item.total.toStringAsFixed(2)} ج.م',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => cart
                                            .decrement(item.product.name),
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                      ),
                                      Text(
                                        '${item.quantity}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        onPressed: () => cart
                                            .increment(item.product.name),
                                        icon:
                                        const Icon(Icons.add_circle_outline),
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),
                                  // IconButton(
                                  //   onPressed: () =>
                                  //       cart.remove(item.product.name),
                                  //   icon: const Icon(Icons.delete_outline),
                                  //   color: Colors.grey.shade600,
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) =>
                        const SizedBox(height: 12),
                        itemCount: cart.items.length,
                      ),
                    ),

                    // الأسفل (الإجمالي)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, -2),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('المبلغ'),
                              Text(
                                '${cart.subtotal.toStringAsFixed(2)} ج.م',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('رسوم التوصيل'),
                              Text(
                                '${cart.deliveryFee.toStringAsFixed(2)} ج.م',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('الإجمالي'),
                              Text(
                                '${cart.total.toStringAsFixed(2)} ج.م',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const CheckoutScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding:
                                const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('متابعة لإدخال البيانات'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
