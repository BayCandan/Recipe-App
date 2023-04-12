import 'package:flutter/material.dart';

Widget Stick() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 5),
          height: 5,
          width: 32 * 2,
          decoration:const BoxDecoration(
            gradient:  LinearGradient(
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
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white54, Colors.black54],
            ),
          ),
        ),
      ),
    ],
  );
}
