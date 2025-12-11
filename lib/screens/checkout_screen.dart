import 'package:alshaatir/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../providers/cart_provider.dart';
import 'order_summary_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _latController;
  late final TextEditingController _lngController;
  late final TextEditingController _notesController;
  late final TextEditingController _promoController;
  String _paymentMethod = 'الدفع عند الاستلام';
  String _deliveryMethod = 'استلام من الفرع';

  @override
  void initState() {
    super.initState();
    final cart = context.read<CartProvider>();
    _phoneController = TextEditingController(text: cart.phone);
    _addressController = TextEditingController(text: cart.address);
    _latController = TextEditingController(text: cart.lat);
    _lngController = TextEditingController(text: cart.lng);
    _notesController = TextEditingController(text: cart.notes);
    _promoController = TextEditingController(text: cart.promoCode);
    _paymentMethod = cart.paymentMethod;
    _deliveryMethod = cart.deliveryMethod;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    _latController.dispose();
    _lngController.dispose();
    _notesController.dispose();
    _promoController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final cart = context.read<CartProvider>();
    cart.setCheckoutDetails(
      phone: _phoneController.text.trim(),
      address: _addressController.text.trim(),
      lat: _latController.text.trim(),
      lng: _lngController.text.trim(),
    );
    cart.setPaymentMethod(_paymentMethod);
    cart.setDeliveryMethod(_deliveryMethod);
    cart.setNotes(_notesController.text.trim());
    cart.applyPromo(_promoController.text.trim());

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const OrderSummaryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بيانات التوصيل'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionCard(
                title: 'رقم الهاتف',
                icon: Icons.phone_android,
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'أدخل رقم هاتفك',
                    prefixIcon: Icon(Icons.phone_android),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'يرجى إدخال رقم الهاتف';
                    }
                    if (value.trim().length < 8) {
                      return 'رقم الهاتف غير مكتمل';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 12),
              _SectionCard(
                title: 'العنوان',
                icon: Icons.location_on_outlined,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _addressController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        hintText: 'أدخل العنوان الكامل',
                        prefixIcon: Icon(Icons.home_outlined),
                        alignLabelWithHint: true,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'يرجى إدخال العنوان';
                        }
                        if (value.trim().length < 5) {
                          return 'أدخل عنواناً أوضح';
                        }
                        return null;
                      },
                    ),
                    // const SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextFormField(
                    //         controller: _latController,
                    //         keyboardType: TextInputType.number,
                    //         decoration: const InputDecoration(
                    //           hintText: 'Latitude (اختياري)',
                    //           prefixIcon: Icon(Icons.map_outlined),
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 8),
                    //     Expanded(
                    //       child: TextFormField(
                    //         controller: _lngController,
                    //         keyboardType: TextInputType.number,
                    //         decoration: const InputDecoration(
                    //           hintText: 'Longitude (اختياري)',
                    //           prefixIcon: Icon(Icons.map_outlined),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _SectionCard(
                title: 'كود الخصم',
                icon: Icons.local_offer_outlined,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _promoController,
                        decoration: const InputDecoration(
                          hintText: 'كود الخصم',
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<CartProvider>()
                            .applyPromo(_promoController.text.trim());
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.info(
                            message: 'تم تطبيق كود الخصم (إن وجد)',
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                      ),
                      child: const Text('إضافة'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _SectionCard(
                title: 'الطلبات الخاصة',
                icon: Icons.note_outlined,
                child: TextFormField(
                  controller: _notesController,
                  maxLines: 3,
                  decoration:
                      const InputDecoration(hintText: 'ملاحظات (اختياري)'),
                ),
              ),
              const SizedBox(height: 12),
              Consumer<CartProvider>(
                builder: (context, cart, _) {
                  return _SectionCard(
                    title: 'ملخص الطلب',
                    icon: Icons.receipt_long_outlined,
                    child: Column(
                      children: [
                        _SummaryRow(
                            label: 'المجموع الفرعي',
                            value:
                                '${cart.subtotal.toStringAsFixed(2)} ج.م'),
                        _SummaryRow(label: 'الضريبة', value: '0.00 ج.م'),
                        _SummaryRow(
                            label: 'رسوم التوصيل',
                            value: cart.deliveryFee == 0
                                ? 'Free'
                                : '${cart.deliveryFee.toStringAsFixed(2)} ج.م'),
                        if (cart.discount > 0)
                          _SummaryRow(
                              label: 'الخصم',
                              value:
                                  '- ${cart.discount.toStringAsFixed(2)} ج.م'),
                        const Divider(),
                        _SummaryRow(
                          label: 'الإجمالي',
                          value: '${cart.total.toStringAsFixed(2)} ج.م',
                          isBold: true,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('المتابعة للدفع'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SectionCard({
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
              Icon(icon, size: 18, color: AppColors.primary),
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

class _RadioTile extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const _RadioTile({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      contentPadding: EdgeInsets.zero,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(title),
      activeColor: AppColors.primary,
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
              color: isBold ? AppColors.primary : Colors.black87,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
