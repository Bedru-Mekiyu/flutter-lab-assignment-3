class Album {
  final int userId;
  final int id;
  final String title;
  final String? thumbnailUrl;

  Album({
    required this.userId,
    required this.id,
    required this.title,
    this.thumbnailUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json, {String? thumbnailUrl}) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      thumbnailUrl: thumbnailUrl,
    );
  }
}