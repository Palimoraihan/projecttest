import 'package:flutter/material.dart';
import 'package:github_app/model/model.dart';
import 'package:github_app/services/database.dart';
import 'package:github_app/services/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyProvider extends ChangeNotifier {
  final ApiServices apiServices;
  final Database db;
  MyProvider({required this.apiServices, required this.db});

  List<ItemM> search = [];
  final _fav = Hive.box('favorite');
  Future<dynamic> searchData(String text) async {
    try {
      final dataGit = await apiServices.myServer(text);
      search.clear();
      if (text.isEmpty) {
        notifyListeners();
        return;
      }
      for (var idx in dataGit.listModel) {
        final name = idx.name!.toLowerCase();
        final desc = idx.description!.toLowerCase();
        if (name.contains(text.toLowerCase()) &&
            desc.contains(text.toLowerCase())) {
          search.add(idx);
        }
        notifyListeners();
      }
      // for(var idx = 0; idx< dataGit.listModel.length;idx++ ){

      // }

    } catch (e) {
      print(e);
    }
  }

  void getSomeData() {
    if (_fav.get('favorite') == null) {
      return;
    } else {
      db.getData();
      notifyListeners();
    }
  }

  void addToDb(String text) {
    db.dbHive.add(['name', text]);
    notifyListeners();
    db.updateData();
    print(db.dbHive);
  }
}
