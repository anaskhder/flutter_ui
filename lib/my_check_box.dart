// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  MyCheckBox({super.key});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool javaScript = false;

  bool cSharp = false;

  bool python = false;

  String get txt {
    String str = "You Selected:\n";
    if (javaScript == true) str += "javaScript\n";
    if (cSharp == true) str += "C#\n";
    if (python == true)
      str += "Python\n";
    else if (javaScript == false && cSharp == false && python == false)
      str += "None!\n";
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Select All Programming Languages You Know",
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            CheckboxListTile(
              title: Text("javaScript"),
              value: javaScript,
              onChanged: (value) {
                javaScript = value!;
                setState(() {});
              },
            ),
            Divider(color: Colors.black),
            CheckboxListTile(
              title: Text("C#"),
              value: cSharp,
              onChanged: (value) {
                cSharp = value!;
                setState(() {});
              },
            ),
            Divider(color: Colors.black),
            CheckboxListTile(
              title: Text("Python"),
              value: python,
              onChanged: (value) {
                python = value!;
                setState(() {});
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("Apply!"),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Thank You For Applying!"),
                  content: Text(txt),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
