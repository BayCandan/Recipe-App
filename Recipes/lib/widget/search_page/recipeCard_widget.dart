import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../pages/detail_page.dart';
import '../../services/recipe_service.dart';

Services _recipeServices = Services();

Widget RecipeCard(addList) {
  return Expanded(
      child: Center(
    child: FutureBuilder<List>(
      future: _recipeServices.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var result = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) {
              var user = result;
              List len = user[index]["recipe"]["ingredients"];
              double caloriesDB = user[index]["recipe"]["calories"];
              int calories = caloriesDB.toInt();

              return InkWell(
                onTap: () {
                  addList(user, index);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage()));
                },
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '${user[index]["recipe"]["image"]}',
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          // height: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "${user[index]["recipe"]["label"]}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.amber,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                   "Ingridients (${len.length.toString()})",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.amber,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                   "Calories $calories",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: result.length,
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return CircularProgressIndicator();
        }
      },
    ),
  ));
}
