import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    var searchBox = Hive.box("search");
    var favoriteBox = Hive.box("favorite");
    List<dynamic> simdilikListe = [];
    
    print(" ${searchBox.toMap()}");

    addList(){
    
    simdilikListe.add(searchBox.getAt(0));
    simdilikListe.add(searchBox.getAt(1));
    simdilikListe.add(searchBox.getAt(2));
    simdilikListe.add(searchBox.getAt(4));
    // simdilikListe.add(searchBox.getAt(5));
    // simdilikListe.add(searchBox.getAt(6));
    }
    Widget deleteBgItem(){
      return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Colors.red.shade300,
        child: Icon(Icons.delete, color: Colors.white,),
      );
    }

    Widget rowItem(context, index){
      return Dismissible(key: Key(simdilikListe[index],),
      onDismissed: (direction) {
        searchBox.deleteAt(index);
      },
      background: deleteBgItem(),
       child: Card(child: ListTile(title: Text(simdilikListe[index]),leading: IconButton(icon: Icon(Icons.delete),onPressed: () {
         favoriteBox.clear();
       },),),),);
    }
    
    Widget showList(){
      addList();
      return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: simdilikListe.length,
        itemBuilder: (BuildContext context, int index ){
          return rowItem(context,index);
        });
    }

    
    
    
    return Scaffold(
      body: Container(child: showList(),)
    );
  }
}
