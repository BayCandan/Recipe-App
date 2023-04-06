// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RecipeModel recipeModelFromMap(String str) => RecipeModel.fromMap(json.decode(str));

String recipeModelToMap(RecipeModel data) => json.encode(data.toMap());

class RecipeModel {
    RecipeModel({
        required this.label,
        required this.image,
        required this.dietLabels,
        required this.ingredientLines,
        required this.ingredients,
        required this.calories,
        required this.totalWeight,
        required this.totalTime,
        required this.cuisineType,
        required this.mealType,
        required this.dishType,
        required this.totalNutrients,
    });

    final String label;
    final String image;
    final List<String> dietLabels;
    final List<String> ingredientLines;
    final List<Ingredient> ingredients;
    final double calories;
    final double totalWeight;
    final int totalTime;
    final List<String> cuisineType;
    final List<String> mealType;
    final List<String> dishType;
    final TotalNutrients totalNutrients;

    factory RecipeModel.fromMap(Map<String, dynamic> json) => RecipeModel(
        label: json["label"],
        image: json["image"],
        dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
        ingredientLines: List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromMap(x))),
        calories: json["calories"].toDouble(),
        totalWeight: json["totalWeight"].toDouble(),
        totalTime: json["totalTime"],
        cuisineType: List<String>.from(json["cuisineType"].map((x) => x)),
        mealType: List<String>.from(json["mealType"].map((x) => x)),
        dishType: List<String>.from(json["dishType"].map((x) => x)),
        totalNutrients: TotalNutrients.fromMap(json["totalNutrients"]),
    );

    Map<String, dynamic> toMap() => {
        "label": label,
        "image": image,
        "dietLabels": List<dynamic>.from(dietLabels.map((x) => x)),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toMap())),
        "calories": calories,
        "totalWeight": totalWeight,
        "totalTime": totalTime,
        "cuisineType": List<dynamic>.from(cuisineType.map((x) => x)),
        "mealType": List<dynamic>.from(mealType.map((x) => x)),
        "dishType": List<dynamic>.from(dishType.map((x) => x)),
        "totalNutrients": totalNutrients.toMap(),
    };
}

class Ingredient {
    Ingredient({
        required this.text,
        required this.quantity,
        required this.measure,
        required this.food,
        required this.weight,
        required this.foodCategory,
        required this.foodId,
        required this.image,
    });

    final String text;
    final int quantity;
    final String measure;
    final String food;
    final int weight;
    final String foodCategory;
    final String foodId;
    final String image;

    factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
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

class TotalNutrients {
    TotalNutrients({
        required this.enercKcal,
        required this.fat,
        required this.chocdf,
        required this.sugar,
        required this.procnt,
    });

    final Chocdf enercKcal;
    final Chocdf fat;
    final Chocdf chocdf;
    final Chocdf sugar;
    final Chocdf procnt;

    factory TotalNutrients.fromMap(Map<String, dynamic> json) => TotalNutrients(
        enercKcal: Chocdf.fromMap(json["ENERC_KCAL"]),
        fat: Chocdf.fromMap(json["FAT"]),
        chocdf: Chocdf.fromMap(json["CHOCDF"]),
        sugar: Chocdf.fromMap(json["SUGAR"]),
        procnt: Chocdf.fromMap(json["PROCNT"]),
    );

    Map<String, dynamic> toMap() => {
        "ENERC_KCAL": enercKcal.toMap(),
        "FAT": fat.toMap(),
        "CHOCDF": chocdf.toMap(),
        "SUGAR": sugar.toMap(),
        "PROCNT": procnt.toMap(),
    };
}

class Chocdf {
    Chocdf({
        required this.label,
        required this.quantity,
        required this.unit,
    });

    final String label;
    final double quantity;
    final String unit;

    factory Chocdf.fromMap(Map<String, dynamic> json) => Chocdf(
        label: json["label"],
        quantity: json["quantity"].toDouble(),
        unit: json["unit"],
    );

    Map<String, dynamic> toMap() => {
        "label": label,
        "quantity": quantity,
        "unit": unit,
    };
}
