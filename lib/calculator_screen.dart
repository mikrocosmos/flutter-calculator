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
                      height: screenSize.width / 5,
                      width: item == Button.n0
                          ? screenSize.width / 1.7
                          : screenSize.width / 5,
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
        padding: const EdgeInsets.all(2.0),
        child: Material(
          color: getBtnColor(value),
          shape: OutlineInputBorder(
            borderSide: const BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(25),
          ),
          child: InkWell(
            onTap: () => onBtnTap(value),
            child: Center(
                child: Text(value,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500,
                        color: Colors.black
                    ))),
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
      default:
        appendValue(value);
    }
  }

  void clearAll() {
    setState(() {
      a = '';
      action = '';
      b = '';
    });
  }

  void delete() {
    if (b.isNotEmpty) {
      setState(() {
        b = b.substring(0, b.length - 1);
      });
    } else if (action.isNotEmpty) {
      setState(() {
        action = '';
      });
    } else if (a.isNotEmpty) {
      setState(() {
        a = a.substring(0, a.length - 1);
      });
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

  void appendValue(String value) {
    if (value != Button.point && int.tryParse(value) == null) {
      if (b.isNotEmpty && action.isNotEmpty) {
        calc();
      }
      action = value;
    } else if (a.isEmpty || action.isEmpty) {
      if (value == Button.point && a.contains(Button.point)) {
        return;
      }
      if (value == Button.point && (a.isEmpty || a == Button.n0)) {
        value = "0.";
      }
      a += value;
    } else if (b.isEmpty || action.isNotEmpty) {
      if (value == Button.point && b.contains(Button.point)) {
        return;
      }
      if (value == Button.point && (b.isEmpty || b == Button.n0)) {
        value = "0.";
        return;
      }
      b += value;
    }
    setState(() {});
  }

  Color getBtnColor(value) {
    return [Button.delete, Button.clear].contains(value)
        ? Color(0xFFFF7B7B)
        : [
            Button.percent,
            Button.multiply,
            Button.plus,
            Button.equal,
            Button.minus,
            Button.divide
          ].contains(value)
            ? Color(0xFF86FF6C)
            : Color(0xFFFFFFFF);
  }
}
