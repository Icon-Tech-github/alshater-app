import 'package:flutter/material.dart';

import '../models/category_model.dart';

class FavoritesProvider extends ChangeNotifier {
  final Map<String, Product> _favorites = {};

  List<Product> get favorites => _favorites.values.toList();

  bool isFavorite(String productName) => _favorites.containsKey(productName);

  void toggleFavorite(Product product) {
    if (_favorites.containsKey(product.name)) {
      _favorites.remove(product.name);
    } else {
      _favorites[product.name] = product;
    }
    notifyListeners();
  }
}

