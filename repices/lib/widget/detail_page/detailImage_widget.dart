import 'package:flutter/material.dart';


Widget DetailImage(context,data,indexGenel){
      Size size = MediaQuery.of(context).size;

  return
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
          );
}