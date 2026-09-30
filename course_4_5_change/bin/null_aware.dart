// Sound Null Safety
// Null - aware операторы:
// 1. if-null оператор
// 2. ??= оператор присваивания
// 3. ?. оператор доступа
// 4. ! оператор утверждения (bang оператор)
// 5. as оператор преобразования типов
void main() {
  print(someValue(40));
  // print(someValue(null));
  int? age;
  age ??= 18;
  print(age);
  print(absoluteValue(-30));
  print(absoluteValue(null));
  num? value = 15;
  num otherValue = value as int;
  print(otherValue);
}
int? absoluteValue(int? value) {
  return value?.abs() ?? 0;
}
int someValue(int? value) {
  return value!;
}