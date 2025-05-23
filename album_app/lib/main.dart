import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'bloc/album_bloc.dart'; // Adjusted for bloc directory
import 'repository/album_repository.dart';
import 'screens/album_list_screen.dart';
import 'screens/album_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AlbumListScreen(),
      ),
      GoRoute(
        path: '/details/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return AlbumDetailScreen(albumId: id);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AlbumRepository(http.Client()),
      child: BlocProvider(
        create: (context) => AlbumBloc(context.read<AlbumRepository>()),
        child: MaterialApp.router(
          title: 'Album App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: _router,
        ),
      ),
    );
  }
}