import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CartItem {
  final Product product;
  double price;
  String sizeLabel;
  int quantity;

  CartItem({
    required this.product,
    required this.price,
    required this.sizeLabel,
    this.quantity = 1,
  });

  double get total => price * quantity;
}

class OrderModel {
  final String id;
  final double total;
  final DateTime date;
  final String status; // 'قادم' أو 'سابق'
  final List<CartItem> items;

  OrderModel({
    required this.id,
    required this.total,
    required this.date,
    required this.status,
    required this.items,
  });
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  final List<OrderModel> _orders = [];
  String _phone = '';
  String _address = '';
  String _paymentMethod = 'الدفع عند الاستلام';
  String _deliveryMethod = 'استلام من الفرع';
  String _notes = '';
  String _promoCode = '';
  double _discount = 0;
  String _lat = '';
  String _lng = '';

  List<CartItem> get items => _items.values.toList();
  int get totalItems =>
      _items.values.fold(0, (previousValue, element) => previousValue + element.quantity);
  String get phone => _phone;
  String get address => _address;
  String get lat => _lat;
  String get lng => _lng;
  String get paymentMethod => _paymentMethod;
  String get deliveryMethod => _deliveryMethod;
  String get notes => _notes;
  String get promoCode => _promoCode;
  double get discount => _discount;

  double get subtotal => _items.values.fold(
      0, (previousValue, element) => previousValue + element.total);

  double get deliveryFee => _items.isEmpty ? 0 : 10; // flat fee

  double get total => subtotal + deliveryFee - discount;

  int quantityOf(String productName) => _items[productName]?.quantity ?? 0;

  List<OrderModel> get upcomingOrders =>
      _orders.where((o) => o.status == 'قادم').toList();

  List<OrderModel> get previousOrders =>
      _orders.where((o) => o.status == 'سابق').toList();

  void addToCart(
      Product product, {
        required double price,
        required String sizeLabel,
      }) {
    if (_items.containsKey(product.name)) {
      final item = _items[product.name]!;
      item.price = price;
      item.sizeLabel = sizeLabel;
      item.quantity += 1;
    } else {
      _items[product.name] = CartItem(
        product: product,
        price: price,
        sizeLabel: sizeLabel,
      );
    }
    notifyListeners();
  }

  void increment(String productName) {
    if (_items.containsKey(productName)) {
      _items[productName]!.quantity += 1;
      notifyListeners();
    }
  }

  void decrement(String productName) {
    if (!_items.containsKey(productName)) return;
    final item = _items[productName]!;
    if (item.quantity > 1) {
      item.quantity -= 1;
    } else {
      _items.remove(productName);
    }
    notifyListeners();
  }

  void remove(String productName) {
    _items.remove(productName);
    notifyListeners();
  }

  void setCheckoutDetails({
    required String phone,
    required String address,
    required String lat,
    required String lng,
  }) {
    _phone = phone;
    _address = address;
    _lat = lat;
    _lng = lng;
    notifyListeners();
  }

  void setPaymentMethod(String method) {
    _paymentMethod = method;
    notifyListeners();
  }

  void setDeliveryMethod(String method) {
    _deliveryMethod = method;
    notifyListeners();
  }

  void setNotes(String value) {
    _notes = value;
    notifyListeners();
  }

  void applyPromo(String code) {
    _promoCode = code;
    // Simple example: fixed discount if code is not empty.
    _discount = code.isNotEmpty ? 5 : 0;
    notifyListeners();
  }

  void clearCheckoutDetails() {
    _phone = '';
    _address = '';
    _lat = '';
    _lng = '';
    _paymentMethod = 'الدفع عند الاستلام';
    _deliveryMethod = 'استلام من الفرع';
    _notes = '';
    _promoCode = '';
    _discount = 0;
  }

  void addOrder({
    required String id,
    required double total,
    required String status,
  }) {
    // Create a snapshot of cart items to store with the order
    final snapshotItems = _items.values
        .map(
          (item) => CartItem(
        product: item.product,
        price: item.price,
        sizeLabel: item.sizeLabel,
        quantity: item.quantity,
      ),
    )
        .toList();

    _orders.insert(
      0,
      OrderModel(
        id: id,
        total: total,
        date: DateTime.now(),
        status: status,
        items: snapshotItems,
      ),
    );
    notifyListeners();
  }

  void markOrderAsPrevious(String id) {
    final index = _orders.indexWhere((o) => o.id == id);
    if (index != -1) {
      final order = _orders[index];
      _orders[index] = OrderModel(
        id: order.id,
        total: order.total,
        date: order.date,
        status: 'سابق',
        items: order.items,
      );
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    clearCheckoutDetails();
    notifyListeners();
  }
}

