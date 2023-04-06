import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:repices/services/recipe_service.dart';

import '../trash/models/recipeModel.dart';

class SearchHistory extends StatefulWidget {
  const SearchHistory({super.key});

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

Services services = Services();

class _SearchHistoryState extends State<SearchHistory> {
  @override
  Widget build(BuildContext context) {
    var searchBox = Hive.box("search");
    services.getData();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: services.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var recipeList = snapshot.data;
              return 
              ListView.builder(itemBuilder: (context, index) {
                var recipe = recipeList![index];
                return ListTile(
                  title: Text(recipe.label),
                  subtitle: Text(
                    recipe.calories.toString()
                  ),
                  leading: Text(recipe.cuisineType.toString()),
                );
              });
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
