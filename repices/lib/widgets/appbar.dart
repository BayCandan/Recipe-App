import 'package:flutter/material.dart';

class RepiceAppBar extends AppBar {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {},
        child: const Text(
          "  Repices",
          style: TextStyle(color: Colors.white),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
