import 'package:flutter/material.dart';

TextEditingController _controller = TextEditingController();

Widget searchField(search) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: _controller,
        onSubmitted: (String giris) {
          search(giris);
        },
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            hintText: "eg: salad",
            prefixIcon: Icon(Icons.search),
            iconColor: Colors.purple.shade900),
      ));
}
