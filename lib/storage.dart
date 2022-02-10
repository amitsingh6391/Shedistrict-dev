import 'dart:convert';

import 'package:localstorage/localstorage.dart';
class Storage{
  final LocalStorage storage = new LocalStorage('she');

  Future<void> set(String name, values) async {
    await storage.ready;
    final items = json.encode(values);
    print('item $items');
    await storage.setItem(name, items);
    print('setting done...');
  }

  Future get(String name) async {
    await storage.ready;
    final items = await storage.getItem(name);
    return items != null ? json.decode(items) : "";
  }

  Future<void> delete(String name) async {
    await storage.ready;
    await storage.deleteItem(name);
  }
}