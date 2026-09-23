


void main() {
  Map<String, int> categories = {'Kitchen': 1, 'Bedroom': 2};
  print(categories['Room']);

  int value1 = categories['Room'] ?? 3;
  print(value1);

  int value2 = categories['Room'] ??= 3;
  print(value2);

  int? value3 = categories['Kitchen'];
  print(value3);

  int value4 = categories['Kitchen']!;
  print(value4);
  print(categories);

  // List<String?> nullableValuesList = [null, 'London', null, 'Moscow', 'NY'];
  // List<String>? nullableList;
  // List<String?>? nullableListAndNullableValue = [null, 'String'];
  
  // print(nullableList?[0]);

  // nullableValuesList[0] ??= 'SPB';
  // print(nullableValuesList);

  // String someString = nullableValuesList[2] ?? 'Vologda';
  // print(someString);
}
