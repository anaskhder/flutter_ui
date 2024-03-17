import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: Text(
          "Test",
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
