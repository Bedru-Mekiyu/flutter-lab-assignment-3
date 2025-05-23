import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/album_repository.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc(this.repository) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await repository.fetchAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });

    on<FetchAlbumDetails>((event, emit) async {
      emit(AlbumLoading());
      try {
        final photos = await repository.fetchPhotos(event.albumId);
        emit(AlbumDetailsLoaded(photos));
      } catch (e) {
        emit(AlbumError(e.toString()));
      }
    });
  }
}