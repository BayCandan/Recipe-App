import 'package:flutter/material.dart';

Widget isEmptyWidget() {
  return Column(
    children: [
      SizedBox(
        height: 100,
      ),
      Center(
        child: Text(
          "Please Search To Sort The List.",
          style: TextStyle(fontSize: 25),
        ),
      ),
    ],
  );
}
