
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String searchHint;

  const Header({required this.searchHint});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade700,
      padding: const EdgeInsets.all(
          16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 44,
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          searchHint,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const Icon(Icons.qr_code_scanner, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 12),
          // Row(
          //   children: [
          //     const Icon(Icons.location_on, color: Colors.white),
          //     const SizedBox(width: 6),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: const [
          //         Text(
          //           'منزلك الحالي',
          //           style: TextStyle(
          //               color: Colors.white, fontWeight: FontWeight.bold),
          //         ),
          //         Text(
          //           'السعودية - الرياض - محطة الفحص الدوري',
          //           style: TextStyle(color: Colors.white70, fontSize: 12),
          //         ),
          //       ],
          //     ),
          //     const Spacer(),
          //     Container(
          //       padding:
          //       const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Text(
          //         'تغيير',
          //         style: TextStyle(
          //             color: Colors.red.shade700, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}