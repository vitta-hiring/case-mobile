import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/app/modules/home/components/movie_tile/movie_tile_widget.dart';

main() {
  testWidgets('MovieTileWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(MovieTileWidget()));
    final textFinder = find.text('MovieTile');
    expect(textFinder, findsOneWidget);
  });
}
