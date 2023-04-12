import 'package:flutter/material.dart';
import 'package:repices/widget/custom_SizedBox.dart';

Widget EmptyWidget() {
  return Column(
    children: [
      HSB(100.0),
      Center(
        child: Text(
          "Please Search To Sort The List.",
          style: TextStyle(fontSize: 25),
        ),
      ),
    ],
  );
}
