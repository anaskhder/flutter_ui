// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_ui/build_dialog.dart';
import 'package:flutter_ui/drop_down_buttton.dart';
import 'package:flutter_ui/my_check_box.dart';
import 'package:flutter_ui/my_provider.dart';
import 'package:flutter_ui/my_radio.dart';
import 'package:flutter_ui/p_view.dart';
import 'package:flutter_ui/radio_list_tile.dart';
import 'package:flutter_ui/test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: PView(),
    ));

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          expansionTileTheme: ExpansionTileThemeData(
            collapsedIconColor: Colors.white,
            collapsedTextColor: Colors.white,
            shape: Border.all(color: Colors.black),
            collapsedBackgroundColor: Colors.blue,
            collapsedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          useMaterial3: false,
          primaryColor: Colors.black,
          hintColor: Colors.grey,
          appBarTheme: AppBarTheme(color: Colors.blue)),
      darkTheme: ThemeData(
          expansionTileTheme: ExpansionTileThemeData(
            collapsedTextColor: Colors.white,
            collapsedIconColor: Colors.white,
            textColor: const Color.fromARGB(98, 255, 214, 64),
            iconColor: const Color.fromARGB(98, 255, 214, 64),
            shape: Border.all(color: const Color.fromARGB(98, 255, 214, 64)),
            collapsedBackgroundColor: Color.fromARGB(255, 23, 21, 21),
            collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side:
                    BorderSide(color: const Color.fromARGB(98, 255, 214, 64))),
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.black, shadowColor: Colors.amberAccent),
          primaryColor: Colors.white,
          hintColor: Colors.grey,
          useMaterial3: false,
          canvasColor: Colors.black,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      const Color.fromARGB(255, 23, 21, 21)),
                  side: MaterialStatePropertyAll(BorderSide(
                      color: const Color.fromARGB(98, 255, 214, 64)))))),
      themeMode: context.watch<MyProvider>().tm,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List imageList = [
    'images/s1.jpg',
    'images/s2.jpg',
    'images/s3.jpg',
  ];
  var currentIndex;
  bool swVal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Light", style: TextStyle(fontSize: 20)),
                  Switch(
                    activeColor: Colors.amberAccent,
                    value: swVal,
                    onChanged: (newValue) {
                      swVal = newValue;
                      swVal == true
                          ? context.read<MyProvider>().changeThemeToDark()
                          : context.read<MyProvider>().changeThemeToLight();
                      setState(() {});
                    },
                  ),
                  Text("Dark", style: TextStyle(fontSize: 20)),
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
              children: [
                //SizedBox(height: 60),
                BuildRichText(context),
                SizedBox(height: 10),
                BuildSelectableText(),
                SizedBox(height: 10),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BuildCarouselSlider(),
                        SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                                color: currentIndex == 0
                                    ? Colors.green
                                    : Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black),
                                  color: currentIndex == 1
                                      ? Colors.green
                                      : Colors.white),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black),
                                  color: currentIndex == 2
                                      ? Colors.green
                                      : Colors.white),
                            ),
                          ],
                        ),
                      ]),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Dialog", style: TextStyle(fontSize: 25)),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (innerContext) {
                        var dialogObject = BuildDialog();
                        return dialogObject.myDialog(
                            title: "Dialog",
                            mainText: "This is an instance of the main text",
                            buttonsList: [
                              Container(
                                width: 90,
                                child: ElevatedButton(
                                  child: Text("Close"),
                                  onPressed: () => Navigator.pop(innerContext),
                                ),
                              ),
                              Container(
                                width: 90,
                                child: ElevatedButton(
                                  child: Text("Test"),
                                  onPressed: () {
                                    Navigator.pop(innerContext);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Test(),
                                        ));
                                  },
                                ),
                              ),
                              Container(
                                width: 90,
                                child: ElevatedButton(
                                  child: Text("No"),
                                  onPressed: () {},
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("FlushBar", style: TextStyle(fontSize: 25)),
                    onPressed: () {
                      BuildFlushbar(context).show(context);
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Toast", style: TextStyle(fontSize: 25)),
                    onPressed: () => BuildShowToast(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Slider", style: TextStyle(fontSize: 25)),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Container(
                          height: 300,
                          width: 300,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BuildCarouselSlider(),
                                SizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black),
                                        color: currentIndex == 0
                                            ? Colors.green
                                            : Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.black),
                                          color: currentIndex == 1
                                              ? Colors.green
                                              : Colors.white),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.black),
                                          color: currentIndex == 2
                                              ? Colors.green
                                              : Colors.white),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Radio",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyRadio(),
                        )),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text(
                        "RadioListTile",
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyRadioListTile(),
                          ))),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text(
                        "CheckBox",
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyCheckBox(),
                          ))),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: Text(
                        "Drop Down Button",
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyDropDownButton(),
                          ))),
                ),
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(bottom: 20),
                  title: Text("Expansion Tile",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25)),
                  children: [
                    ListTile(
                      title: Text("Sign Up!"),
                      titleTextStyle: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 16),
                      subtitle: Text("This is The Subtitle"),
                      subtitleTextStyle:
                          TextStyle(color: Theme.of(context).hintColor),
                      onTap: BuildShowToast,
                    ),
                    Divider(color: Theme.of(context).primaryColor),
                    Text(
                      "#3",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    Divider(color: Theme.of(context).primaryColor),
                    Text(
                      "#4",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  CarouselSlider BuildCarouselSlider() {
    return CarouselSlider(
      items: imageList
          .map((imageUrl) => Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 3)),
                width: double.infinity,
                // color: Colors.amber,
                child: Image.asset(imageUrl, fit: BoxFit.contain),
              ))
          .toList(),
      options: CarouselOptions(
        height: 250,
        initialPage: 0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayAnimationDuration: Durations.extralong4,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayCurve: decelerateEasing,
        enlargeFactor: 0.3,
        onPageChanged: (index, _) {
          setState(() {
            currentIndex = index;
          });
          // print(currentIndex);
        },
      ),
    );
  }

  SelectableText BuildSelectableText() {
    return SelectableText(
      showCursor: true,
      "This is a very clear example of \"SelectableText\"",
      style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
      textAlign: TextAlign.center,
    );
  }
}

Flushbar<dynamic> BuildFlushbar(BuildContext context) {
  return Flushbar(
    mainButton: TextButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      label: Text("Close"),
      icon: Icon(Icons.undo_outlined),
    ),
    icon: Icon(
      Icons.info_outline,
      color: Colors.white,
    ),
    titleText: Text(
      "Title",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 16),
    ),
    borderWidth: 3,
    barBlur: 10,
    animationDuration: Durations.extralong1,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    duration: Duration(seconds: 10),
    messageText: Text(
      "This is the message",
      style: TextStyle(color: Colors.white),
    ),
  );
}

Future<bool?> BuildShowToast() {
  return Fluttertoast.showToast(
    msg: "Toast Test",
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
  );
}

RichText BuildRichText(context) {
  return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: "RichText",
            style: TextStyle(fontSize: 35, color: Colors.pink)),
        TextSpan(
            text: " /",
            style:
                TextStyle(fontSize: 35, color: Theme.of(context).primaryColor)),
        TextSpan(
            text: "TextSpan",
            style: TextStyle(fontSize: 35, color: Colors.blue)),
      ]));
}
