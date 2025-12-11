import 'package:alshaatir/features/screens/widgets/default_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import 'success_screen.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, cart, _) {
          return Column(
            children: [
              const DefaultHeader(title: "مراجعة الطلب",height: 60,),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _CardBlock(
                      title: 'معلومات الاتصال',
                      icon: Icons.phone_in_talk_outlined,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cart.phone,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          if (cart.address.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on_outlined, size: 18),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    cart.address,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          if (cart.lat.isNotEmpty || cart.lng.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.map_outlined, size: 18),
                                const SizedBox(width: 6),
                                Text(
                                  'Lat: ${cart.lat.isEmpty ? '-' : cart.lat} / Lng: ${cart.lng.isEmpty ? '-' : cart.lng}',
                                  style:
                                      const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    _CardBlock(
                      title: 'عناصر الطلب',
                      icon: Icons.shopping_cart_outlined,
                      child: Column(
                        children: cart.items
                            .map(
                              (item) => ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    item.product.imageUrl,
                                    height: 48,
                                    width: 48,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                title: Text(item.product.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    '${item.quantity} الكمية · ر.س ${item.product.price.toStringAsFixed(2)}'),
                                trailing: Text(
                                  'ر.س ${item.total.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _CardBlock(
                      title: 'ملخص الطلب',
                      icon: Icons.receipt_long_outlined,
                      child: Column(
                        children: [
                          _SummaryRow(
                              label: 'المجموع الفرعي',
                              value:
                                  'ر.س ${cart.subtotal.toStringAsFixed(2)}'),
                          _SummaryRow(label: 'الضريبة', value: 'ر.س 0.00'),
                          _SummaryRow(
                              label: 'رسوم التوصيل',
                              value: cart.deliveryFee == 0
                                  ? 'Free'
                                  : 'ر.س ${cart.deliveryFee.toStringAsFixed(2)}'),
                          if (cart.discount > 0)
                            _SummaryRow(
                              label: 'الخصم',
                              value:
                                  '- ر.س ${cart.discount.toStringAsFixed(2)}',
                              isBold: true,
                            ),
                          const Divider(),
                          _SummaryRow(
                            label: 'الإجمالي',
                            value: 'ر.س ${cart.total.toStringAsFixed(2)}',
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final orderId =
                          'JY-${DateTime.now().millisecondsSinceEpoch % 10000}';
                      final totalString = cart.total.toStringAsFixed(2);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SuccessScreen(
                            orderId: orderId,
                            total: totalString,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('تأكيد الطلب'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CardBlock extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _CardBlock({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: Colors.red.shade700),
              const SizedBox(width: 6),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isBold ? Colors.red.shade700 : Colors.black87,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

