// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({super.key});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  List letterList = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  String? selectedLetter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drop Down Button"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Select A Letter ",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            //width: 300,
            child: DropdownButton(
              hint: Text("Select"),
              value: selectedLetter,
              items: letterList
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (newvalue) {
                selectedLetter = newvalue as String?;
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}
