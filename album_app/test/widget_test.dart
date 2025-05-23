import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:album_app/main.dart';

void main() {
  testWidgets('Album list screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();
    expect(find.text('Albums'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text('quidem molestiae enim'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsWidgets);
  });
}
