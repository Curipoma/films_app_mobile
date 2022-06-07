import 'package:films/db/favoriteFilm.dart';
import 'package:films/models/film.dart';
import 'package:films/screens/list_films.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Film> _films = [];

  @override
  void initState() {
    super.initState();
    _films.addAll(favoriteFilms.getFavoriteFilms());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ListFilms(films: _films),
        ],
      ),
    );
  }
}
