import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:repices/pages/deneme_ynei.dart';
import 'package:repices/pages/favorite_page.dart';
import 'package:repices/trash/custom_search.dart';
import 'package:repices/pages/favorite.dart';
import 'package:repices/pages/son.dart';

import '../services/recipe_service.dart';
import '../state_data.dart';
import 'details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void updateList(String value) {}
  Services _recipeServices = Services();

  double dabil = 2.25555;
  @override
  Widget build(BuildContext context) {
    Function newName = Provider.of<StateDataCH>(context).getName;
    Function addList = Provider.of<StateDataCH>(context).addList;
    Function search = Provider.of<StateDataCH>(context).newSearch;
    String bosString = Provider.of<StateDataCH>(context).bosString;

    TextEditingController _controller = TextEditingController();
    var searchBox = Hive.box("search");
    var favoriteBox = Hive.box("favorite");

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Colors.grey.shade200),

        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.767,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                ),
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(
                      "https://www.kevserinmutfagi.com/wp-content/uploads/2012/10/coban_salata1.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Text(''),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: const Text("Search History"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchHistory()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: const Text("Favorite dishes"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: const Text("About"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Favorite()));
              },
            ),
          ],
        ),
      ),
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
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Search For A Recipe",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
               
                  
                onSubmitted: (String giris) {
                 
                  search(giris);
                  textfiedldeneme(giris);

                },
                // autocorrect: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none),
                    hintText: "eg: salad",
                    prefixIcon: Icon(Icons.search),
                    iconColor: Colors.purple.shade900),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            bosString.isEmpty
                ? Bos()
                : 
                Expanded(
                    child: Center(
                      child: FutureBuilder<List>(
                        
                        future: _recipeServices.getBisi(),
                        // future: newSearch(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            
                            var result = snapshot.data!;
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                var user = result;
                                return InkWell(
                                  onTap: () {
                                    addList(user, index);
                                    // newName(user[index]["recipe"]["label"], index);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DenemePage()));
                                  },
                                  child: AspectRatio(
                                    aspectRatio: 2.8,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      user[index]["recipe"]
                                                          ["label"],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          AspectRatio(
                                            aspectRatio: 1.5,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(10)),
                                              child: Image.network(
                                                '${user[index]["recipe"]["image"]}',
                                                alignment: Alignment.centerLeft,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
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
                    ),
                  )
          ],
        ),
      ),
    );
  }

  textfiedldeneme(String giris) {
    // Provider.of<StateDataCH>(context).newSearch(giris);
    
    print(giris);
  }

  Widget Bos() {
    return Container(
      child: Text("LOOOOOOO"),
    );
  }
}
