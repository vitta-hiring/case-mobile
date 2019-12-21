import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:movie_app/app/modules/components/custom_app_bar/custom_app_bar_page.dart';

main() {
  testWidgets('CustomAppBarPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CustomAppBarPage(title: 'CustomAppBar')));
    final titleFinder = find.text('CustomAppBar');
    expect(titleFinder, findsOneWidget);
  });
}
