import 'dart:convert';

import 'package:benjamin/model/restaurant_model.dart';
import 'package:firebase_database/firebase_database.dart';

import '../const/const.dart';

Future<List<RestaurantModel>> getRestaurantList() async {
  var list = List<RestaurantModel>.empty(growable: true);
  var source =
      await FirebaseDatabase.instance.ref().child(RESTAURANT_REF).once();

  Map<dynamic, dynamic> values = source as Map;
  values.forEach((key, value) {
    list.add(RestaurantModel.fromJson(jsonDecode(jsonEncode(value))));
  });

  return list;
}
