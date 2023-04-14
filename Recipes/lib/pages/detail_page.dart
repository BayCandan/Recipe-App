import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:repices/state_data.dart';
import 'package:repices/widget/detail_page/detailImage_widget.dart';
import 'package:repices/widget/detail_page/detailMid_Widget.dart';
import 'package:repices/widget/detail_page/detailStick_widget.dart';
import 'package:repices/widget/detail_page/ingridients_widget.dart';

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
          DetailImage(context, data, indexGenel),
          DetailMid(data, indexGenel, len),
          Ingridients(context, len)
        ],
      ),
    );
  }

}
