import 'package:flutter/material.dart';

import 'package:github_app/provider/provider.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final connProf = Provider.of<MyProvider>(context, listen: false);
      connProf.getSomeData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myprof = Provider.of<MyProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: myprof.db.dbHive.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var dataItem = myprof.db.dbHive[index];
                return Center(child: Card(child: Text('${dataItem[1]}')));
              })),
    );
  }
}
