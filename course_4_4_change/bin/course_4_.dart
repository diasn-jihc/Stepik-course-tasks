// Sound Null Safety
// Type System: Non-nullable & nullable types
// Flow Analysis: Promotion & Definite Assignment

void main() {
  print(someValue(40));
  print(someValue(null));
  int x;
  if (40 > 0) {
    x = 2;
  } else {
    x = -2;
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
