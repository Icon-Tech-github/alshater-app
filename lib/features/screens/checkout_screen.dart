import 'package:alshaatir/core/app_colors.dart';
import 'package:alshaatir/features/screens/widgets/default_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DefaultHeader(title: "بيانات التوصيل",height: 60,),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SectionCard(
                      title: 'رقم الهاتف',
                      icon: Icons.phone_android,
                      child:    TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: _inputDecoration('رقم الجوال', Icons.phone_outlined),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'يرجى إدخال رقم الجوال';
                          }
                          if (value.trim().length < 8) {
                            return 'رقم الجوال غير صحيح';
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
                            textInputAction: TextInputAction.next,
                            decoration: _inputDecoration('الموقع', Icons.location_on_outlined),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'يرجى إدخال الموقع';
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
                              decoration: _inputDecoration('كود الخصم', Icons.airplane_ticket_rounded),

                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .applyPromo(_promoController.text.trim());
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('تم تطبيق كود الخصم (إن وجد)')),
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
                        decoration: _inputDecoration('ملاحظات (اختياري)', Icons.note_sharp),
                       maxLines: 3,
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
                                  value: 'ر.س ${cart.subtotal.toStringAsFixed(2)}'),
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
                                        '- ر.س ${cart.discount.toStringAsFixed(2)}'),
                              const Divider(),
                              _SummaryRow(
                                label: 'الإجمالي',
                                value: 'ر.س ${cart.total.toStringAsFixed(2)}',
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
          ],
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
