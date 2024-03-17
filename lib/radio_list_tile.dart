// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class MyRadioListTile extends StatefulWidget {
  const MyRadioListTile({super.key});

  @override
  State<MyRadioListTile> createState() => _MyRadioListTileState();
}

class _MyRadioListTileState extends State<MyRadioListTile> {
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Radio List Tile")),
      body: Container(
        height: double.infinity,
        color: bgColor,
        child: Column(
          children: [
            BuildRadioListTile(
              color: Colors.yellow,
              title: "Change to Yellow",
              subTitle: "Yellow Sub",
            ),
            BuildRadioListTile(
              color: Colors.lightGreenAccent,
              title: "Change to LightGreenAccent",
              subTitle: "LightGreenAccent Sub",
            ),
            BuildRadioListTile(
              color: Colors.white,
              title: "Return to White",
              subTitle: "White Sub",
            ),
          ],
        ),
      ),
    );
  }

  RadioListTile<Color> BuildRadioListTile({
    required Color color,
    required String title,
    required String subTitle,
  }) {
    return RadioListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: color,
      groupValue: bgColor,
      onChanged: (value) {
        bgColor = value;
        setState(() {});
      },
    );
  }
}
