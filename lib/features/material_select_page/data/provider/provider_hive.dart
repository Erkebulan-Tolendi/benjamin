import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProviderHive extends ChangeNotifier {
  final Box _materialBox;

  ProviderHive(this._materialBox);

  List<Map<String, dynamic>> get items {
    final data = _materialBox.keys.map((key) {
      final item = _materialBox.get(key);
      return {
        "key": key,
        "name": item["name"],
        "img": item["img"],
        "desc": item["desc"],
        "price": item["price"],
        "total_price": item["total_price"],
      };
    }).toList();
    return data.reversed.toList();
  }

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await _materialBox.add(newItem);
    notifyListeners();
  }

  Future<void> deleteItem(int itemKey) async {
    await _materialBox.delete(itemKey);
    notifyListeners();
  }

  Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
    await _materialBox.put(itemKey, item);
    notifyListeners();
  }
}
