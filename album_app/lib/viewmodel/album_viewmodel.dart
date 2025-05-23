import '../bloc/album_bloc.dart';
import '../bloc/album_event.dart';

class AlbumViewModel {
  final AlbumBloc bloc;
  AlbumViewModel(this.bloc);

  void fetchAlbums() {
    bloc.add(FetchAlbums());
  }

  void fetchPhotos(int albumId) { // Renamed from fetchAlbumDetails
    bloc.add(FetchAlbumDetails(albumId));
  }
}