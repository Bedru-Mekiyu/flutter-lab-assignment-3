import 'dart:convert';
import 'package:album_app/repository/album_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:album_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  testWidgets('Album list screen displays correctly', (WidgetTester tester) async {
    final mockClient = MockClient((request) async {
      if (request.url.path == '/albums') {
        return http.Response(
          json.encode([
            {'userId': 1, 'id': 1, 'title': 'quidem molestiae enim'}
          ]),
          200,
        );
      } else if (request.url.path == '/photos') {
        return http.Response(
          json.encode([
            {'albumId': 1, 'id': 1, 'title': 'accusamus ea aliquid et et eaque', 'url': 'https://via.placeholder.com/600/92c952', 'thumbnailUrl': null}
          ]),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });

    final repository = AlbumRepository(mockClient);

    await tester.pumpWidget(MyApp(repository: repository));
    expect(find.text('Albums'), findsOneWidget);

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('quidem molestiae enim'), findsOneWidget);
  });
}
