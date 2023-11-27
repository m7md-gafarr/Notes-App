import 'package:flutter/material.dart';

class AppBar_Widget extends StatelessWidget {
  const AppBar_Widget({super.key, required this.Titel, required this.icon});
  final String Titel;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Titel,
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.w300),
        ),
        Container(
          height: 45,
          width: 45,
          child: icon,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ],
    );
  }
}
