// import 'dart:convert';
// import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// import '../trash/models/recipeModel.dart';
// import '../state_data.dart';

class Services {
  List<dynamic> data = [];
  String search = '';

  Future<List> getData() async {
    List recipeList ;
    int lastIndex;

    var box = Hive.box("search");
    var dataBox = Hive.box("data");
    lastIndex = (box.length - 1);
    search = box.getAt(lastIndex);

    if (search.isNotEmpty) {
      try {
        var response = await Dio().get(
            'https://api.edamam.com/search?q=$search&app_id=0e8815f8&app_key=4b6ff7e246529f262865656ad6f35db2');
        if (response.statusCode == 200) {
          data = response.data['hits'];
        }

        // print('data geldi: ${data[0]["recipe"]["label"]}');
     
        print("getRecipeList Calist");
        await dataBox.clear();
        dataBox.add(data);

        print("++++++++++++++++${data[0]['recipe']['label']}");
        getBisi();
        return data;
      } on DioError catch (e) {
        return Future.error(e.message.toString());
      }
    } else {
      return [];
    }
    
  }
  Future<List> getBisi()async{

    var dataBox = Hive.box('data');
    var block ;
    block = dataBox.getAt(0);
    // print("---------$block");
    // print("=========${block[0]['recipe']['label']}");
    // print(data);
    return block;
  }
}
