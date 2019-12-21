import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:movie_app/app/modules/home/components/top_popularity_tab/top_popularity_tab_page.dart';

main() {
  testWidgets('TopPopularityTabPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(TopPopularityTabPage(title: 'TopPopularityTab')));
    final titleFinder = find.text('TopPopularityTab');
    expect(titleFinder, findsOneWidget);
  });
}
