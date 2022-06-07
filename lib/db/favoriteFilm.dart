import 'package:films/models/film.dart';

class FavoriteFilm {
  final List<Film> _favoriteFilms = [];

  List<Film> getFavoriteFilms() {
    return _favoriteFilms;
  }

  void addFavoriteFilm(Film film) {
    _favoriteFilms.add(film);
  }

  bool getFavoriteFilm(Film film) {
    return _favoriteFilms.contains(film);
  }

  bool deleteFavoriteFilm(Film film) {
    return _favoriteFilms.remove(film);
  }
}

FavoriteFilm favoriteFilms = FavoriteFilm();
