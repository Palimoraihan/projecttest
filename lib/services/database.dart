import 'package:hive_flutter/hive_flutter.dart';

class Database  {
  List dbHive =[];
  final _fav = Hive.box('favorite');

  void getData(){
    dbHive = _fav.get("Favorite");
  }

  void updateData(){
    _fav.put("Favorite", dbHive);
  }
}