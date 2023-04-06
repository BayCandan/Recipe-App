import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    List<String> _values = ['One', 'Two', 'Three', 'Four', 'Five'];
    var box = Hive.box("favorite");
    var searchBox = Hive.box("search");

    List<dynamic> simdilikListe = [];
    List<dynamic> denemeListe = [];
    print(box.toMap().toString());
    denemeListe.add(box.toMap());

    for (var i = 0; i < denemeListe[0].length; i++) {
      simdilikListe.add(denemeListe[0][i]);
    }
    addList() {
      // print('deneme listes ${denemeListe}');
      // print('deneme listes ${denemeListe[0]}');
      // print('deneme listes ${denemeListe[0][0]}');
      // print('deneme listes ${denemeListe[0][1]}');
      // print('deneme listes ${denemeListe[0][2]}');

      print("                  ");
      print("             -     ");
      print("                  ");
      print("              -    ");

      print(denemeListe[0].length.toString());

      print("${simdilikListe[0]}");

      // simdilikListe.add(searchBox.getAt(0));
      // simdilikListe.add(searchBox.getAt(1));
      // simdilikListe.add(searchBox.getAt(2));
      // simdilikListe.add(searchBox.getAt(4));
      print("_+_+_+_");
      // print(simdilikListe[1][0]);
      // print(simdilikListe[2][0]);
      // print(simdilikListe[3][0]);
      print(box.get(0));
      // var kus = box.get(0).cast<String,dynamic>();
      print("KUSSSSS ");
    }

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
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.startToEnd) {
            print("Add to favorite");
          } else {
            print('Remove item');
          }

          setState(() {
            _values.removeAt(index);
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
                              _values[index],
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
          itemCount: _values.length,
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
