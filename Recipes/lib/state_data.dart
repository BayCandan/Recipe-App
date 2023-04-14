import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:repices/services/recipe_service.dart';

class StateDataCH extends ChangeNotifier {
  String bosString = '';
  String name = "adanda";
  List<dynamic> simdilikListe = [];
  List<dynamic> denemeListe = [];

  int index = 0;
  List listState = [];
  Services recipeServices = Services();

  
  Future<void> newSearch(String search) async {
    var box = Hive.box("search");

    print("Girilen Metin $search");
    search = search.toLowerCase();
    search = search.replaceAll(' ', '-');
    print("Duzenlenen Metin $search");

    await box.add(search);
    bosString = search;
    recipeServices.getData();

    notifyListeners();
  }

  Future<void> favoriteButton(String label) async {
    var box = Hive.box('favorite');

    for (var i = 0; i < box.length; i++) {
      if (label == box.getAt(i)) {
        print("var");
        // await box.deleteAt(i);
        break;
      } else {
        print("yok");
        // await box.add(label);
        break;
      }
    }
    await box.add(label);

    print('########');
    print(box.toMap().toString());
    print('########');
  }

  bool favoriteChange(String label) {
    var box = Hive.box('favorite');
    var favoriteBool = false;
    for (var i = 0; i < box.length; i++) {
      if (label == box.getAt(i)) {
        print("var");

        favoriteBool = false;
      } else {
        print("yok");
        favoriteBool = true;
      }
    }
    return favoriteBool;
  }

  void addList(List data, int int) {
    listState = data;
    index = int;
    notifyListeners();
  }

  
}
