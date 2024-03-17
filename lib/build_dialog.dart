// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class BuildDialog {
  AlertDialog myDialog({
    required String title,
    required String mainText,
    required List<Widget> buttonsList,
  }) {
    return AlertDialog(
      title: Center(child: Text(title)),
      content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Divider(color: Colors.black),
              Text(mainText),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buttonsList,
              ),
            ],
          )),
    );
  }
}
