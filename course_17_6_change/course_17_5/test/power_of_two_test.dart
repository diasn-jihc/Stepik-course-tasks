import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:course_17_4/calculator.dart';
import 'package:course_17_4/power_of_two.dart';

class MockCalculator extends Mock implements Calculator {}

void main() {
  late MockCalculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('PowerOfTwo', () {
    testWidgets('renders the result provided by the calculator',
        (tester) async {

      when(() => calculator.powerOfTwo(5))
          .thenAnswer((realInvocation) => Future.value(25));
          
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PowerOfTwo(
              calculator: calculator,
            ),
          ),
        ),
      );
      await tester.enterText(find.byKey(const Key('textField_powerOfTwo')), '5');
      await tester.pumpAndSettle();
      expect(find.text('Result: 25.0'), findsOneWidget);
    });
  });
}
