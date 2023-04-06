import 'package:flutter/material.dart';

class ONe extends StatelessWidget {
  const ONe({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 1.65,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AspectRatio(
                      aspectRatio: 0.71,
                      child: Image.network(
                        "https://github.com/BayCandan/SpyGame-1.0.0/blob/main/spy/assets/card_icon.png?raw=true",
                        fit: BoxFit.cover,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
