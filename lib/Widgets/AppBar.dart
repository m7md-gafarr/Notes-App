import 'package:flutter/material.dart';

class AppBar_Widget extends StatelessWidget {
  const AppBar_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Notes",
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.w300),
        ),
        Container(
          height: 45,
          width: 45,
          child: Icon(Icons.search, size: 25),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ],
    );
  }
}
