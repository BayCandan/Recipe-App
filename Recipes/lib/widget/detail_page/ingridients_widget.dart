import 'package:flutter/material.dart';

import 'detailStick_widget.dart';
// Size size = MediaQuery.of(context).size;

Widget Ingridients(context, len) {
  Size size = MediaQuery.of(context).size;

  return Expanded(
    child: Container(
      height: size.height / 2,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stick(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: len.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200),
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text("${len[index]['food']}"),
                      leading: DoubleText(len[index]['quantity']),
                      trailing: Text("${len[index]['measure'].toString()}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget DoubleText(double gelen) {
  var giden = gelen.toStringAsFixed(2);

  return Text(giden);
}
