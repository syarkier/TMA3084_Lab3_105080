import 'package:flutter_test/flutter_test.dart';
import 'package:menu_app/main.dart';

void main() {
  testWidgets('Menu page shows the title and first item', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Our Menu'), findsOneWidget);
    expect(find.text('Espresso'), findsOneWidget);
  });
}
