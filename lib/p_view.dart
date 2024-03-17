// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconData;

  Data({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.iconData,
  });
}

class PView extends StatefulWidget {
  const PView({super.key});

  @override
  State<PView> createState() => _PViewState();
}

class _PViewState extends State<PView> {
  List<Data> myData = [
    Data(
      title: "title 1",
      description: "This is the description 1",
      imageUrl: "images/s1.jpg",
      iconData: Icons.add_box,
    ),
    Data(
      title: "title 2",
      description: "This is the description 2",
      imageUrl: "images/s2.jpg",
      iconData: Icons.add_circle,
    ),
    Data(
      title: "title 3",
      description: "This is the description 3",
      imageUrl: "images/s3.jpg",
      iconData: Icons.add_comment,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              children: myData
                  .map((e) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: ExactAssetImage(e.imageUrl),
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(e.iconData, size: 130),
                            SizedBox(height: 50),
                            Text(e.title,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            // SizedBox(height: 20),
                            Text(
                              e.description,
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {}))
          ],
        ),
      ),
    );
  }
}
