import 'dart:io';

import 'package:VittaChallenge/widgets/home/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import '../../mocks/mock_binding_home.dart';

void main() {
  GetMaterialApp sut;
  setUp(() {
    HttpOverrides.global = null;

    sut = GetMaterialApp(
      initialBinding: MockHomeBinding(),
      defaultTransition: Transition.fade,
      home: HomeUI(),
    );
  });
  group('test home widget', () {
    testWidgets(
        'should hide the intro component and show gridview if returns films from api ',
        (WidgetTester tester) async {
      await tester.pumpWidget(sut);

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      final input = find.byKey(Key('input'));
      await tester.enterText(input, "rambo");
      await tester.pump(Duration(milliseconds: 800));

      /**verify if HomeIntroComponent is hide */
      final imageIntroComponent = find.byKey(Key('homeintro'));

      /**verify if GridView is visible */
      final gridview = find.byKey(Key('gridview_films'));

      expect(imageIntroComponent, findsNothing);
      expect(gridview, findsOneWidget);
    });

    testWidgets(
        'should hide the gridview  and show homeintro if NOT returns films from api ',
        (WidgetTester tester) async {
      await tester.pumpWidget(sut);

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      final input = find.byKey(Key('input'));
      await tester.enterText(input, "not_found_films");
      await tester.pump(Duration(milliseconds: 800));

      /**verify if HomeIntroComponent is hide */
      final imageIntroComponent = find.byKey(Key('homeintro'));

      /**verify if GridView is visible */
      final gridview = find.byKey(Key('gridview_films'));

      expect(imageIntroComponent, findsOneWidget);
      expect(gridview, findsNothing);
    });
  });
}
