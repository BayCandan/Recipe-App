import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../state_data.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> _values = ['One', 'Two', 'Three', 'Four', 'Five'];

  List<dynamic> denemeListe = [];
  @override
  

  @override
  Widget build(BuildContext context) {
    
    List simdilikListe = Provider.of<StateDataCH>(context).simdilikListe;
    // Function favoriteList = Provider.of<StateDataCH>(context).favoriteList;
    Function favoriteDelete = Provider.of<StateDataCH>(context).favoriteDelete;

    DismissDirection _dismissDirection = DismissDirection.horizontal;

    var box = Hive.box("favorite");
    var searchBox = Hive.box("search");

    Widget deleteBgItem() {
      return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Colors.red.shade300,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      );
    }

    Widget rowItem(context, index) {
      // final item = _values[index];
      return Dismissible(
        key: UniqueKey(),
        direction: _dismissDirection,
        onDismissed: (DismissDirection direction) {
          // print(box.getAt(index));
          setState(() {
            favoriteDelete(index);
            print(simdilikListe);
            print(box.values);
          });
        },
        background: deleteBgItem(),
        child: InkWell(
          onTap: () {},
          child: Card(
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              simdilikListe[index][0],
                              textAlign: TextAlign.center,
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
                  // Container(
                  //   width: 200,
                  //   child: ClipRRect(
                  //     borderRadius:
                  //         BorderRadius.horizontal(right: Radius.circular(10)),
                  //     child: Image.network(
                  //       simdilikListe[index][1],
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget showList() {
      return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: simdilikListe.length,
          itemBuilder: (BuildContext contex, int index) {
            return rowItem(contex, index);
          });
    }

    return Scaffold(
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
      body: Container(
        child: showList(),
      ),
    );
  }
}
