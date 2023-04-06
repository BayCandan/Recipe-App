import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:repices/pages/detail_page.dart';
import 'package:repices/pages/history.dart';
import 'package:repices/widget/drawer_widget.dart';
import 'package:repices/widget/search_isEmpty.dart';
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
  Services _recipeServices = Services();

  double dabil = 2.25555;
  @override
  Widget build(BuildContext context) {
    Function addList = Provider.of<StateDataCH>(context).addList;
    Function search = Provider.of<StateDataCH>(context).newSearch;
    String bosString = Provider.of<StateDataCH>(context).bosString;

    TextEditingController _controller = TextEditingController();
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
                controller: _controller,
                onSubmitted: (String giris) {
                  search(giris);
                },
                style: TextStyle(color: Colors.black),
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
                ? isEmptyWidget()
                : Expanded(
                    child: Center(
                      child: FutureBuilder<List>(
                        future: _recipeServices.getData(),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage()));
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

  
}
