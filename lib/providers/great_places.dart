import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:places/helpers/db_helper.dart';
import 'package:places/models/place.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace({required String title, required File image}) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);

    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    dataList
        .map((e) => Place(
            id: e['id'],
            title: e['title'],
            image: File(e['image']),
            location: null))
        .toList();
    notifyListeners();
  }
}
