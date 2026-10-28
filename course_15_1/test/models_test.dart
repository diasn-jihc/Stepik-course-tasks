import 'package:flutter_test/flutter_test.dart';
import 'package:course_15_1/models/location.dart';
import 'package:course_15_1/models/user.dart';

void main() {
  test('User JSON includes nested locations', () {
    const user = User(
      name: 'User A',
      age: 30,
      locations: [Location(zipcode: '59601')],
    );

    final json = user.toJson();
    final restored = User.fromJson(json);

    expect(json['locations'], [
      {'city': 'Helena', 'zipcode': '59601'},
    ]);
    expect(restored, user);
  });
}
