import 'package:flutter/material.dart';

final class FavoriteProvider extends ChangeNotifier {
 
   final Map<int, bool> _favoriteStates = {};

 Map<int, bool> get favoriteStates => _favoriteStates;

  void selectedFavorite(int index) {
      _favoriteStates[index] ??= false;
    _favoriteStates[index] = !_favoriteStates[index]!;
    notifyListeners();
  }
}
