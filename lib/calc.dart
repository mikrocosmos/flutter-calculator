import 'dart:math';

import 'package:flutter/foundation.dart';

double add(double a, double b) {
  return a + b;
}

double minus(double a, double b) {
  return a - b;
}

double multiply(double a, double b) {
  return a * b;
}

double divide(double a, double b) {
  if (b == 0) {
    if (kDebugMode) {
      print("Ошибка");
    }
    return 0;
  }
  return a / b;
}

double squareRoot(double a) {
  return sqrt(a);
}

int byteLeft(double a, double b) {
  return a.toInt() << b.toInt();
}

int byteRight(double a, double b) {
  return a.toInt() >> b.toInt();
}

int factorial(double n) {
  if (n <= 1) {
    return 1;
  }
  return factorial(n - 1);
}

dynamic calculate() {
  double a = 5;
  double b = 7;
  String action = "test";
  switch (action) {
    case "+":
      return add(a, b);
      break;
    case "-":
      return minus(a, b);
      break;
    case "*":
      return multiply(a, b);
      break;
    case "/":
      return divide(a, b);
      break;
    case "!":
      return factorial(a);
      break;
    case "sqrt":
      return squareRoot(a);
      break;
    case "byteLeft":
      return byteLeft(a, b);
      break;
    case "byteRight":
      return byteRight(a, b);
      break;
    default:
      if (kDebugMode) {
        print("нет такого действия");
      }
  }
}
