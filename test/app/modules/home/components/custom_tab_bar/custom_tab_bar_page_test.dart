import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:movie_app/app/modules/home/components/custom_tab_bar/custom_tab_bar_page.dart';

main() {
  testWidgets('CustomTabBarPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(CustomTabBarPage(title: 'CustomTabBar')));
    final titleFinder = find.text('CustomTabBar');
    expect(titleFinder, findsOneWidget);
  });
}
