// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyRadio extends StatefulWidget {
  MyRadio({super.key});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  int radioValue = 0;
  String? result;
  Color? resultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Radio")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Guess the answer: 2 + 2 = ?",
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            radioRow(3),
            radioRow(4),
            radioRow(5),
          ],
        ),
      ),
    );
  }

  Row radioRow(int value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: radioValue,
          onChanged: (value) {
            radioValue = value!;
            result = value == 4 ? "Correct Answer!" : "Wrong Answer";
            resultColor = value == 4 ? Colors.green : Colors.red;
            myDialog();
            setState(() {});
          },
        ),
        Text("$value"),
      ],
    );
  }

  myDialog() {
    showDialog(
      context: context,
      builder: (innerContext) => AlertDialog(
        content: Container(
          height: 100,
          child: Column(
            children: [
              Text(
                "$result",
                style: TextStyle(color: resultColor),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Answer is 4"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
