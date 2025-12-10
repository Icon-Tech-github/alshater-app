import 'package:flutter/material.dart';

import 'widgets/bottom_nav_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('طلباتي'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0.4,
          bottom: const TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'السابقة'),
              Tab(text: 'القادمة'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _OrdersList(emptyMessage: 'لا توجد طلبات سابقة حالياً'),
            _OrdersList(emptyMessage: 'لا توجد طلبات قادمة حالياً'),
          ],
        ),
        bottomNavigationBar: const BottomNav(currentIndex: 1),
      ),
    );
  }
}

class _OrdersList extends StatelessWidget {
  final String emptyMessage;

  const _OrdersList({required this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    // Placeholder list. Integrate with real order data when available.
    final orders = <Map<String, String>>[];

    if (orders.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final order = orders[index];
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order['id'] ?? 'طلب #${index + 1}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    order['total'] ?? 'ر.س 0.00',
                    style: TextStyle(
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(order['status'] ?? 'قيد المعالجة',
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemCount: orders.length,
    );
  }
}

