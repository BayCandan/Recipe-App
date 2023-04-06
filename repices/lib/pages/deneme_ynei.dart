import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:repices/my_icon_pack_icons.dart';

import 'package:repices/state_data.dart';

import '../services/recipe_service.dart';
// import 'package:riverpod/riverpod.dart';

class DenemePage extends StatefulWidget {
  DenemePage({
    super.key,
  });

  @override
  State<DenemePage> createState() => _DenemePageState();
}

class _DenemePageState extends State<DenemePage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    Services services = Services();
    var favoriteBox = Hive.box("favorite");
    List favoriteList = [];

    Size size = MediaQuery.of(context).size;
    Function favoriteButton = Provider.of<StateDataCH>(context).favoriteButton;
    Function favoriteChanhe = Provider.of<StateDataCH>(context).favoriteChange;
    List data = Provider.of<StateDataCH>(context).listState;
    int indexGenel = Provider.of<StateDataCH>(context).index;
    // bool favoriteBool = Provider.of<StateDataCH>(context).favoriteBool;

    List len = data[indexGenel]['recipe']['ingredients'];
    String calori = data[indexGenel]['recipe']['colories'].toString();
    String totalTime = data[indexGenel]['recipe']['totalTime'].toString();
    // print("_________------______-${len.length}");
    // print("_________------______-$len");
    // print("_________------______-${len[0]}");
    // print("_________------______-${len[1]}");
    // print("_________------______-${len[2]['text']}");
    // print("_________------______-$totalTime");
    // print("_________------______-$calori");
    bool bol = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "${data[indexGenel]['recipe']['label']}",
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_rounded),
            onPressed: () {
              
              favoriteList.add(data[indexGenel]['recipe']['label']);
              favoriteList.add(data[indexGenel]['recipe']['cuisineType'][0]);
              favoriteBox.put(favoriteBox.length, favoriteList);
            },
          )
          // data[indexGenel]['recipe']['label'],
          // favoriteButton(data[indexGenel]['recipe']['label'])
          //  favoriteList.add(data[indexGenel]['recipe']['image']);
          //  favoriteList.add(len);
          //  print(favoriteList);
          //  print("*******${favoriteBox.values}");
          //  print("*******${favoriteBox.getAt(1)}");
        ],
        iconTheme: IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: size.height / 4,
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "${data[indexGenel]['recipe']['image']}",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.only(bottom: 40, left: 20),

                // height: 50,
                // color: Color.fromARGB(255, 160, 159, 159),
                child: Text(
                  "Ingridients (${len.length.toString()})",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  maxLines: 3,
                  // textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40, right: 20),
                padding: EdgeInsets.all(10),
                // width: 100,
                // height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${data[indexGenel]['recipe']['cuisineType'][0]}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              height: size.height / 2,
              width: size.width,
              // margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            height: 5,
                            width: 32 * 2,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.black54, Colors.white54],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            height: 5,
                            width: 32 * 2,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.white54, Colors.black54],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      // child: Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     // Text(
                      //     //   "Ingridients (${len.length.toString()})",
                      //     //   style: const TextStyle(
                      //     //       color: Colors.black,
                      //     //       fontSize: 20,
                      //     //       fontWeight: FontWeight.w600),
                      //     //   maxLines: 3,
                      //     // ),
                      //   ],
                      // ),
                    ),
                    // Container(
                    //   color: Colors.amber,
                    //   padding: EdgeInsets.symmetric(vertical: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Container(
                    //         // width: (size.width / 2)-20,
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Icon(MyIconPack.flame),
                    //                 Text(
                    //                   "${data[indexGenel]['recipe']['colories'].toString()}",
                    //                   textAlign: TextAlign.start,
                    //                 )
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Container(
                    //         // width: size.width / 2,
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Icon(Icons.timer),
                    //                 Text(
                    //                   "${data[indexGenel]['recipe']['totalTime'].toString()}",
                    //                 )
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: len.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    // border: Border.all(),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade200),
                                margin: EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  title: Text("${len[index]['food']}"),
                                  leading: DoubleText(len[index]['quantity']),
                                  trailing: Text(
                                      "${len[index]['measure'].toString()}"),
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget DoubleText(double gelen) {
    var giden = gelen.toStringAsFixed(2);

    return Text(giden);
  }
}
