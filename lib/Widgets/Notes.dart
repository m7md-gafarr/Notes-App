import 'package:flutter/material.dart';

class Note_Widget extends StatelessWidget {
  const Note_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xffffcd7a),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 25, bottom: 20, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Flutter tips",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w500)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 27,
                      ))
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Build your Career with \nMohamed Sobhy",
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 16.5,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "May 21,2023",
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
