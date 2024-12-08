import 'package:flutter/foundation.dart';
import 'package:shiroko/model/model_cute_cat.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<String> _favoriteCats = {};

  bool isFavorite(String catName) {
    return _favoriteCats.contains(catName);
  }

  void toggleFavorite(CuteCat cat) {
    if (_favoriteCats.contains(cat.name)) {
      _favoriteCats.remove(cat.name);
    } else {
      _favoriteCats.add(cat.name);
    }
    notifyListeners();
  }
}