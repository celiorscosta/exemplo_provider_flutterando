import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/hero_model.dart';

class HeroesController extends ChangeNotifier {
  List<HeroModel> heroes = [
    HeroModel(name: 'Thor'),
    HeroModel(name: 'Iron Man'),
    HeroModel(name: 'Spider Man'),
    HeroModel(name: 'Punisher'),
    HeroModel(name: 'Batman'),
  ];

  checkFavorite(HeroModel model) {
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }
}
