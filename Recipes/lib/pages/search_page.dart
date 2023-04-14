// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:repices/pages/detail_page.dart';
import 'package:repices/pages/history_page.dart';
import 'package:repices/widget/custom_SizedBox.dart';
import 'package:repices/widget/drawer_widget.dart';
import 'package:repices/widget/search_page/recipeCard_widget.dart';
import 'package:repices/widget/search_page/searchField_widget.dart';
import 'package:repices/widget/search_page/searchTopText_widget.dart';
import 'package:repices/widget/search_page/search_Empty_widget.dart';
import '../services/recipe_service.dart';
import '../state_data.dart';
import 'favorite_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void updateList(String value) {}

  @override
  Widget build(BuildContext context) {
    Function addList = Provider.of<StateDataCH>(context).addList;
    Function search = Provider.of<StateDataCH>(context).newSearch;
    String bosString = Provider.of<StateDataCH>(context).bosString;

    var searchBox = Hive.box("search");
    var favoriteBox = Hive.box("favorite");

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Recipe App",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HSB(50.0),
            STText(),
            HSB(10.0),
            searchField(search),
            HSB(20.0),
            bosString.isEmpty
                ? EmptyWidget()
                : RecipeCard(addList)
          ],
        ),
      ),
    );
  }

  
}
