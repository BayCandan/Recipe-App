import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:hive/hive.dart';

class Services {
  List<dynamic> data = [];
  String search = '';

  Future<List> getData() async {
    String ID = dotenv.get("APP_ID", fallback: "");
    String KEY = dotenv.get("APP_KEY", fallback: "");

    int lastIndex;

    var box = Hive.box("search");
    var dataBox = Hive.box("data");
    lastIndex = (box.length - 1);
    search = box.getAt(lastIndex);

    if (search.isNotEmpty) {
      try {
        var response = await Dio().get(
            'https://api.edamam.com/search?q=$search&app_id='+ID+'&app_key='+KEY);
        if (response.statusCode == 200) {
          data = response.data['hits'];
        }

        print("getData Calist");
        await dataBox.clear();
        dataBox.add(data);

        getRecipe();
        return data;
      } on DioError catch (e) {
        return Future.error(e.message.toString());
      }
    } else {
      return [];
    }
  }

  Future<List> getRecipe() async {
    var dataBox = Hive.box('data');
    var block;
    block = dataBox.getAt(0);
    print("getRecipe Calist");

    return block;
  }
}
