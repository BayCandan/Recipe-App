import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:repices/pages/search_page.dart';
import 'package:repices/state_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
    await dotenv.load(fileName: '.env');

  await Hive.initFlutter("RecipeGame");
  await Hive.openBox("search");
  await Hive.openBox("index");
  await Hive.openBox("favorite");
  await Hive.openBox("data");

  runApp(ChangeNotifierProvider<StateDataCH>(
      create: (BuildContext context) {
        return StateDataCH();
      },
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SearchPage(),
    );
  }
}
