import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Slid extends StatefulWidget {
  const Slid({super.key});

  @override
  State<Slid> createState() => _SlidState();
}

List<dynamic> simdilikListe = [];
List<dynamic> denemeListe = [];
List<dynamic> ramList = [];
var box = Hive.box("favorite");

class _SlidState extends State<Slid> {
  @override
  void initState() {
    // TODO: implement initState
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
      body: Center(
        child: Container(
            color: Colors.grey.shade300,
            child: ListView.builder(
                itemCount: simdilikListe.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {
                            setState(() {
                              simdilikListe.removeAt(index);
                              ramList = simdilikListe;
                              print('Simdi Delete$simdilikListe');
                              box.deleteAt(index);
                              print('BOX Delete ${box.values}');
                            });
                          }),
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: Container(
                        margin: EdgeInsets.all(5),
                        color: Colors.grey,
                        child: ListTile(
                          title: Text(simdilikListe[index][0].toString()),
                          subtitle: Text(simdilikListe[index][1]),
                        )),
                  );
                })),
      ),
    );
  }
}
