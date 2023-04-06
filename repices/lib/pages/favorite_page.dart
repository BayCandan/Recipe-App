import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePage();
}

List<dynamic> simdilikListe = [];
List<dynamic> denemeListe = [];
List<dynamic> ramList = [];
var box = Hive.box("favorite");

class _FavoritePage extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    simdilikListe.clear();
    denemeListe.add(box.toMap());
    for (var i = 0; i < denemeListe[0].length; i++) {
      simdilikListe.add(denemeListe[0][i]);
    }
    denemeListe.clear();
    for (var i = 0; i < simdilikListe.length; i++) {
      if (simdilikListe[i] == null) {
        simdilikListe[i] = box.getAt(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: ListView.builder(
            itemCount: simdilikListe.length,
            itemBuilder: (context, index) {
              return Slidable(
                endActionPane: ActionPane(
                  motion: StretchMotion(),
                  children: [
                    SlidableAction(
                      
                      onPressed: ((context) {
                        setState(() {
                          simdilikListe.removeAt(index);
                          ramList = simdilikListe;
                          print('Simdi Delete$simdilikListe');
                          box.deleteAt(index);
                          print('BOX Delete${box.values}');
                        });
                      }),
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: 
                Container(
                        margin:  EdgeInsets.symmetric(vertical: 5),         

              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // color: Colors.grey.shade200,
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
                  Container(
                    color: Colors.grey.shade200,
                    margin: EdgeInsets.all(10),
                    width: 200,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(10)),
                      child: Image.network(
                        simdilikListe[index][2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
              );
            },
          ),
        ),
      ),
    );
  }
}
