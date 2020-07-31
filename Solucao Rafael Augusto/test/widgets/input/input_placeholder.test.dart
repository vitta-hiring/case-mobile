import 'package:VittaChallenge/share_components/input/input_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String stateInput = '';

  testWidgets(
    'should return text in placeholder and text inserted in input ',
    (WidgetTester tester) async {
      final sut = MaterialApp(
        home: Scaffold(
          body: Container(
            child: Input(
              placeholder: 'any_text_placeholder',
              onChange: (e) => stateInput = e.toString(),
              value: stateInput,
            ),
          ),
        ),
      );
      await tester.pumpWidget(sut);

      final placeholder = find.text('any_text_placeholder');
      final input = find.byKey(Key('input'));

      await tester.enterText(input, 'any_text');

      expect(placeholder, findsOneWidget);
      expect(input, findsOneWidget);
      expect(find.text('any_text'), findsOneWidget);
    },
  );
}
