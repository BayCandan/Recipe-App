// To parse this JSON data, do
//
//     final icindekilerModel = icindekilerModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

IcindekilerModel icindekilerModelFromMap(String str) => IcindekilerModel.fromMap(json.decode(str));

String icindekilerModelToMap(IcindekilerModel data) => json.encode(data.toMap());

class IcindekilerModel {
    IcindekilerModel({
        required this.text,
        required this.quantity,
        required this.measure,
        required this.food,
        required this.weight,
        required this.foodCategory,
        required this.foodId,
        required this.image,
    });

    final String? text;
    final double? quantity;
    final String? measure;
    final String? food;
    final double? weight;
    final String? foodCategory;
    final String? foodId;
    final String? image;

    factory IcindekilerModel.fromMap(Map<String, dynamic> json) => IcindekilerModel(
        text: json["text"],
        quantity: json["quantity"],
        measure: json["measure"],
        food: json["food"],
        weight: json["weight"],
        foodCategory: json["foodCategory"],
        foodId: json["foodId"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "text": text,
        "quantity": quantity,
        "measure": measure,
        "food": food,
        "weight": weight,
        "foodCategory": foodCategory,
        "foodId": foodId,
        "image": image,
    };
}
