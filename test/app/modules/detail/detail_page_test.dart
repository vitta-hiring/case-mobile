import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:movie_app/app/modules/detail/detail_page.dart';

main() {
  testWidgets('DetailPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(DetailPage(title: 'Detail')));
    final titleFinder = find.text('Detail');
    expect(titleFinder, findsOneWidget);
  });
}
