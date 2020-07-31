import 'package:VittaChallenge/widgets/app/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should create widget app', (WidgetTester tester) async {
    await tester.pumpWidget(AppUI());
  });
}
