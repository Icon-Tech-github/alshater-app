import 'package:alshaatir/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import 'widgets/default_header.dart';
import 'widgets/bottom_nav_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const DefaultHeader(title: 'طلباتي', height: 60),
            Container(
              color: Colors.white,
              child: const TabBar(
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'السابقة'),
                  Tab(text: 'القادمة'),
                ],
              ),
            ),
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, cart, _) {
                  return TabBarView(
                    children: [
                      _OrdersList(
                        orders: cart.previousOrders,
                        emptyMessage: 'لا توجد طلبات سابقة حالياً',
                      ),
                      _OrdersList(
                        orders: cart.upcomingOrders,
                        emptyMessage: 'لا توجد طلبات قادمة حالياً',
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNav(currentIndex: 1),
      ),
    );
  }
}

class _OrdersList extends StatelessWidget {
  final List<OrderModel> orders;
  final String emptyMessage;

  const _OrdersList({
    required this.orders,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
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
                    'طلب #${order.id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    '${order.total.toStringAsFixed(2)} ج.م',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(order.status, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 6),
              Text(
                'التاريخ: ${order.date.toLocal().toString().split('.').first}',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemCount: orders.length,
    );
  }
}

