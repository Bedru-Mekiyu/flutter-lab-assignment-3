import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album.dart';
import '../models/photo.dart';

class AlbumRepository {
  final http.Client client;

  AlbumRepository(this.client);

  Future<List<Album>> fetchAlbums() async {
    try {
      final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      print('Albums response: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final futures = data.map((json) => client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=${json['id']}&_limit=1')));
        final responses = await Future.wait(futures);
        final albums = <Album>[];
        for (var i = 0; i < data.length; i++) {
          String? thumbnailUrl;
          if (responses[i].statusCode == 200) {
            final photos = json.decode(responses[i].body) as List<dynamic>;
            if (photos.isNotEmpty) {
              thumbnailUrl = photos[0]['thumbnailUrl'];
            }
          }
          albums.add(Album.fromJson(data[i], thumbnailUrl: thumbnailUrl));
        }
        return albums;
      } else {
        throw Exception('Failed to load albums: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching albums: $e');
      throw Exception('Network error: $e');
    }
  }

  Future<List<Photo>> fetchPhotos(int albumId) async {
    try {
      final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
      print('Photos response for album $albumId: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching photos: $e');
      throw Exception('Network error: $e');
    }
  }
}