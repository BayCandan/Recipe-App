import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


import 'package:repices/state_data.dart';

import '../services/recipe_service.dart';
// import 'package:riverpod/riverpod.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    Services services = Services();
    var favoriteBox = Hive.box("favorite");
    List favoriteList = [];

    Size size = MediaQuery.of(context).size;
    Function favoriteButton = Provider.of<StateDataCH>(context).favoriteButton;
    Function favoriteChanhge = Provider.of<StateDataCH>(context).favoriteChange;
    List data = Provider.of<StateDataCH>(context).listState;
    int indexGenel = Provider.of<StateDataCH>(context).index;

    List len = data[indexGenel]['recipe']['ingredients'];





    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          overflow: TextOverflow.ellipsis,
          "${data[indexGenel]['recipe']['label']}",
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 65,
              height: 65,
              child: AnimatedButton(
                  text: ' ',
                  icon: Icons.favorite,
                  pressEvent: (() {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.topSlide,
                      showCloseIcon: true,
                      title: "SUCCESS",
                      desc: "Add To Favorites",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        favoriteList.add(data[indexGenel]['recipe']['label']);
                        favoriteList
                            .add(data[indexGenel]['recipe']['cuisineType'][0]);
                        favoriteList.add(data[indexGenel]['recipe']['image']);

                        favoriteBox.put(favoriteBox.length, favoriteList);
                        print("*******${favoriteBox.values}");
                      },
                    ).show();
                  })),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black54),
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

                margin: EdgeInsets.only(bottom: 25, left: 20),

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
                margin: EdgeInsets.only(bottom: 25, right: 20),
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
              decoration: BoxDecoration(
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
                    ),
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

  Widget IconFav() {
    return Icon(
      Icons.favorite_outlined,
      color: Colors.red,
    );
  }

  Widget DoubleText(double gelen) {
    var giden = gelen.toStringAsFixed(2);

    return Text(giden);
  }
}
