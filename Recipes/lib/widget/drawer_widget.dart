import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../pages/favorite_page.dart';
import '../pages/history_page.dart';

class DrawerWidget extends StatelessWidget {
   DrawerWidget({super.key});

  @override
  var box = Hive.box("favorite");

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Colors.grey.shade300),
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
                      "https://media.istockphoto.com/id/1218254547/photo/varied-food-carbohydrates-protein-vegetables-fruits-dairy-legumes-on-wood.jpg?b=1&s=170667a&w=0&k=20&c=uGHRWrmqv4Nxdj7iUO4iYavWLjqFB3uwH1K3RQ9NID0=",
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              trailing: IconButton(onPressed: () async {
                await box.clear();
                print("favorites is deleted");
              }, icon: Icon(Icons.delete)),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: const Text("About"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchHistory()));
              },
            ),
          ],
        ),
      );
  }
}