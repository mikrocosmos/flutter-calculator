class Button {
  const Button();

  static const String n0 = '0';
  static const String n1 = '1';
  static const String n2 = '2';
  static const String n3 = '3';
  static const String n4 = '4';
  static const String n5 = '5';
  static const String n6 = '6';
  static const String n7 = '7';
  static const String n8 = '8';
  static const String n9 = '9';

  static const String plus = '+';
  static const String minus = '-';
  static const String multiply = 'x';
  static const String divide = '/';
  static const String equal = '=';
  static const String clear = 'C';
  static const String factorial = '!';
  static const String byteLeft = '<<';
  static const String byteRight = '>>';
  static const String sqrt = '√';
  static const String point = '.';
  static const String delete = '⌫';
  static const String percent = '%';

  static const List<String> buttons = [
    clear,
    factorial,
    byteLeft,
    delete,

    factorial,
    byteRight,
    sqrt,
    divide,

    n7,
    n8,
    n9,
    multiply,

    n4,
    n5,
    n6,
    minus,

    n1,
    n2,
    n3,
    plus,

    n0,
    point,
    delete,
    equal
  ];
}
