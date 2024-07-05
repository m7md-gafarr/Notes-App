import 'package:flutter/material.dart';

class AppBar_Widget extends StatelessWidget {
  AppBar_Widget(
      {super.key,
      required this.Titel,
      required this.icon,
      required this.onTap});
  final String Titel;
  final Icon icon;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Titel,
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: 45,
            child: icon,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.3),
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ),
      ],
    );
  }
}
