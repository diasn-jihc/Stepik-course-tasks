// Sound Null Safety
// Type System: Non-nullable & nullable types

// Flow Analysis: Promotion & Definite Assignment

void main() {
  print(someValue(25));
  print(someValue(null));

  int x;
  if (25 > 0) {
    x = 1;
  } else {
    x = -1;
  }
  print(x);
}

int someValue(int? value) {
  if (value == null) {
    return valueIsNotDefined();
  }
  return value;
}

Never valueIsNotDefined() {
  throw ArgumentError('Value is not defined');
}