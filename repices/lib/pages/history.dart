import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:repices/services/recipe_service.dart';

class SearchHistory extends StatefulWidget {
  const SearchHistory({super.key});

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

Services services = Services();

class _SearchHistoryState extends State<SearchHistory> {
  @override
  Widget build(BuildContext context) {
    var searchBox = Hive.box("search");

    Future<void> delete() async {
      await searchBox.clear();
    }

    print(searchBox.values);
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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            // width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "HISTORY",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                AnimatedButton(
                    width: 150,
                    // height: 100,
                    color: Colors.red,
                    text: ' ',
                    icon: Icons.delete,
                    pressEvent: (() {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        headerAnimationLoop: true,
                        animType: AnimType.scale,
                        showCloseIcon: true,
                        title: "Attention",
                        desc: "Delete History",
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          setState(() {
                            delete();
                          });
                        },
                      ).show();
                    })),
              ],
            ),
          ),
          Expanded(
            child: Center(
                child: ListView.builder(
                    itemCount: searchBox.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                        color: Colors.grey.shade200,
                        child: ListTile(
                          title: Text(searchBox
                              .getAt(searchBox.length - (index + 1))
                              .toString()),
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
