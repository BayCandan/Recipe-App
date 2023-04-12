import 'package:flutter/material.dart';

Widget DetailMid (data,indexGenel,len){
  return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 25, left: 20),
                child: Text(
                  "Ingridients (${len.length.toString()})",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  maxLines: 3,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25, right: 20),
                padding: EdgeInsets.all(10),
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
          );
}