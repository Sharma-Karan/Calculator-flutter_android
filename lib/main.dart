import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum = 0;
  int secondnum = 0;
  String res = "";
  String texttoshow = "";
  String operatorto = "";

  Widget customButton(String btnValue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnOperate(btnValue),
        child: Text(
          "$btnValue",
          style: TextStyle(
            fontFamily: "Times new Roman",
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  Widget customButton1(String btnValue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnOperate(btnValue),
        color: Colors.cyan,
        focusColor: Colors.cyan,
        highlightColor: Colors.cyan,
        hoverColor: Colors.cyan,
        splashColor: Colors.cyan,
        highlightedBorderColor: Colors.cyan,
        textColor: Colors.cyan,
        highlightElevation: 20.0,
        child: Text(
          "$btnValue",
          style: TextStyle(
              fontFamily: "Times new Roman",
              fontSize: 25.0,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  void btnOperate(String btnValue) {
    if (btnValue == "C") {
      res = "";
      firstnum = 0;
      secondnum = 0;
      texttoshow = "";
      operatorto = "";
    } else if (btnValue == "+" ||
        btnValue == "x" ||
        btnValue == "/" ||
        btnValue == "-") {
      firstnum = int.parse(texttoshow);
      res = "";
      operatorto = btnValue;
    } else if (btnValue == "=") {
      secondnum = int.parse(texttoshow);
      if (operatorto == "+") {
        res = (firstnum + secondnum).toString();
      } else if (operatorto == "-") {
        res = (firstnum - secondnum).toString();
      } else if (operatorto == "x") {
        res = (firstnum * secondnum).toString();
      } else if (operatorto == "/") {
        int temp = (firstnum / secondnum).round();
        res = (temp).toString();
      }
    } else {
      res = int.parse(texttoshow + btnValue).toString();
    }
    setState(() {
      texttoshow = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text("$texttoshow",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              customButton("9"),
              customButton("8"),
              customButton("7"),
              customButton1("+"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton1("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton1("x"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              customButton1("C"),
              customButton("0"),
              customButton1("="),
              customButton1("/"),
            ],
          ),
        ],
      )),
    );
  }
}
