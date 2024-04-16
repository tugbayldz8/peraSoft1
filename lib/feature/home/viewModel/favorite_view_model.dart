import 'package:flutter/material.dart';
import 'package:pera_soft1/product/utils/cache/cache_manager.dart';
import '../data/models/product/product_model.dart';

final class FavoriteViewModel extends ChangeNotifier {
  List<Product> _favoriteStates = [];

  List<Product> get favoriteStates => _favoriteStates;

  void getSelectFavorite() {
    final favorites = CacheManager.getProducts();
    if (favorites != null) {
      _favoriteStates = favorites;
    }
    if (!hasListeners) return;
    notifyListeners();
  }

//************************************tekrarrr yap
  void selectedFavorite(Product item) {
    if (_favoriteStates.contains(item)) return;
    final favorites = List<Product>.from(_favoriteStates);
    favorites.add(item);
    CacheManager.clearList();
    CacheManager.setProducts(favorites);
    _favoriteStates = favorites; 
     if (!hasListeners) return;
    notifyListeners();
  }

  void removeFavoriteAll() {
    final favorites = List<Product>.from(_favoriteStates);
    favorites.clear();
    CacheManager.setProducts(favorites);
    _favoriteStates = favorites;
     if (!hasListeners) return;
    notifyListeners();  
  }

  void removeFavoriteSelect(Product product) {
    final favorites = List<Product>.from(_favoriteStates);
    favorites.remove(product);
    CacheManager.clearList();
    CacheManager.setProducts(favorites);
    _favoriteStates = favorites;
     if (!hasListeners) return;
    notifyListeners();
  }
}
