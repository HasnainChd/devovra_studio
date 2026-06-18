import 'package:flutter_test/flutter_test.dart';
import 'package:devora_studios_website/main.dart';

void main() {
  testWidgets('Smoke test Devora Studios Website', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DevoraStudiosApp());
    
    // Verify that the website title/logo is rendered
    expect(find.textContaining('DEVORA'), findsAtLeast(1));
  });
}
