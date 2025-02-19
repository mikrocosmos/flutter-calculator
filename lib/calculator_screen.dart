import 'dart:math';

import 'package:flutter/material.dart';
import 'button.dart' show Button;
import 'calc.dart'
    show
        add,
        minus,
        multiply,
        divide,
        factorial,
        squareRoot,
        byteLeft,
        byteRight;

var btns = Button();

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  String a = "";
  String action = "";
  String b = "";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBar(
                title: const Text("Калькулятор",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                backgroundColor: Color(0x78393943)),
            Row(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '$a$action$b'.isEmpty ? "0" : '$a $action $b',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ]),
            Wrap(
              children: Button.buttons
                  .map((item) => SizedBox(
                      height: screenSize.width / 4,
                      width: item == Button.n0
                          ? screenSize.width / 2
                          : screenSize.width / 4,
                      child: buildButton(item)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Material(
          color: Color(0xFFBE41FD),
          shape: OutlineInputBorder(
            borderSide: const BorderSide(width: 2.0),
          ),
          borderRadius: BorderRadius.circular(100),
          child: InkWell(
            onTap: () => onBtnTap(),
            child: Center(
                child: Text(value,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500))),
          ),
        ));
  }

  void onBtnTap(String value) {
    switch (value) {
      case Button.clear:
        clearAll();
        break;
      case Button.delete:
        delete();
        break;
      case Button.percent:
        convert();
        break;
      case Button.equal:
        calc();
        break;
    }
  }

  void calc() {
    if (a.isEmpty || b.isEmpty || action.isEmpty) return;

    final double number1 = double.parse(a);
    final double number2 = double.parse(b);

    double result = 0.0;

    switch (action) {
      case Button.plus:
        result = number1 + number2;
        break;
      case Button.minus:
        result = number1 - number2;
        break;
      case Button.multiply:
        result = number1 * number2;
        break;
      case Button.divide:
        result = number1 / number2;
        break;
      case Button.sqrt:
        result = sqrt(number1);
      case Button.byteLeft:
        result = (int.parse(number1 as String) << int.parse(number2 as String))
            as double;
        break;
      case Button.byteRight:
        result = (int.parse(number1 as String) >> int.parse(number2 as String))
            as double;
        break;
    }
    
    setState(() {
      a = result.toStringAsPrecision(5);
      action = '';
      b = '';
    });
  }

  void convert() {
    if (a.isNotEmpty && action.isNotEmpty && b.isNotEmpty) {
      calc();
    }

    final number = double.parse(a);

    setState(() {
      a = '${number / 100}';
      action = '';
      b = '';
    });
  }
}
