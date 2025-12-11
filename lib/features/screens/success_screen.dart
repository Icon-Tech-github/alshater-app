import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black87,
      //   elevation: 0.2,
      //   title: const Text('تأكيد الطلب'),
      //   centerTitle: true,
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),bottomRight: Radius.circular(32)),
              color: Colors.red.shade700,
            ),
            padding: const EdgeInsets.all(
                16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Text('تأكيد الطلب',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white))
              ],
            ),
          ),
          const SizedBox(height: 32),
          Icon(Icons.check_circle,
              size: 250, color: Colors.green.shade600),
          const SizedBox(height: 28),

          const Text(
            'تم ارسال طلبك بنجاح وسوف يتم التواصل معك',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28),
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
                  backgroundColor: Colors.red.shade700,
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
