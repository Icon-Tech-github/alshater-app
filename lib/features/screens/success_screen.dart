import 'package:alshaatir/features/screens/widgets/default_header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../core/app_colors.dart';
import '../providers/cart_provider.dart';

class SuccessScreen extends StatelessWidget {
  final String orderId;
  final String total;

  const SuccessScreen({
    super.key,
    required this.orderId,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DefaultHeader(title: 'تأكيد الطلب',height: 60,),
          const SizedBox(height: 32),
          Lottie.asset("assets/json/Success animation.json"),
          // Icon(Icons.check_circle,
          //     size: 250, color: Colors.green.shade600),
          const SizedBox(height: 28),

          const Text(
            'تم ارسال طلبك بنجاح وسوف يتم التواصل معك',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'رقم الطلب',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '#$orderId',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'الإجمالي',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$total ج.م',
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().clearCart();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('العودة للرئيسية'),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
