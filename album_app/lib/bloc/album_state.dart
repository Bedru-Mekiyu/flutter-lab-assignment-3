abstract class AlbumState {}

class AlbumInitial extends AlbumState {}
class AlbumLoading extends AlbumState {}
class AlbumLoaded extends AlbumState {
  final List<dynamic> albums; // Adjust type based on your Album model
  AlbumLoaded(this.albums);
}
class AlbumDetailsLoaded extends AlbumState {
  final List<dynamic> photos; // Adjust type based on your Photo model
  AlbumDetailsLoaded(this.photos);
}
class AlbumError extends AlbumState {
  final String message;
  AlbumError(this.message);
}