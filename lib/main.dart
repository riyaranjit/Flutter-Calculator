import 'dart:core';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late int firnum;
  late int secnum;
  String texttodisplay = "";
  late String result; //stores intermediate result
  late String operationtoperform;
  String test = "";;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      texttodisplay = "";
      firnum = 0;
      secnum = 0;
      result = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "x" ||
        btntext == "/") {
      firnum = int.parse(texttodisplay);
      result = "";
      operationtoperform = btntext;
    } else if (btntext == "=") {
      secnum = int.parse(texttodisplay);
      if (operationtoperform == "+") {
        result = (firnum + secnum).toString();
      }
      if (operationtoperform == "-") {
        result = (firnum - secnum).toString();
      }
      if (operationtoperform == "x") {
        result = (firnum * secnum).toString();
      }
      if (operationtoperform == "/") {
        result = (firnum ~/ secnum).toString();
      } else {
        result = int.parse(texttodisplay + btntext).toString();
      }
      setState(() {
        texttodisplay = result;
      });
    }
  }

  Widget custombutton(String btnval) {
    return Expanded(
      // ignore: deprecated_member_use
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  'Output',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
