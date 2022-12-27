import 'package:flutter/material.dart';
import 'package:github_app/home.dart';
import 'package:github_app/provider/provider.dart';
import 'package:github_app/services/database.dart';
import 'package:github_app/services/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox('favorite');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MyProvider(
            apiServices: ApiServices(),
            db: Database(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
