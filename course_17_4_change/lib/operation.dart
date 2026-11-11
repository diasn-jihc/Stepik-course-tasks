import 'package:flutter/material.dart';

enum Operation {
  add('Сложение', Icon(Icons.add)),
  substract('Вычитание', Icon(Icons.minimize)),
  multiply('Умножение', Icon(Icons.cancel_outlined)),
  divide('Деление', Icon(Icons.architecture));
  
  final String descriptionOperation;
  final Icon iconOperation;

  const Operation(this.descriptionOperation, this.iconOperation);
}
