import 'dart:convert';

import 'package:films/environment/environment.dart';
import 'package:films/models/film.dart';
import 'package:http/http.dart' as http;

class FilmsHttp {
  final List<Film> films = [];

  Future<List<Film>> getFilmsDb() async {
    var response = await http.get(Uri.parse('$domain/api/films'));
    if (response.statusCode == 200) {
      final List<Film> _films = [];
      final jsonRes = jsonDecode(utf8.decode(response.bodyBytes));
      final jsonData = jsonRes['data'];

      for (var item in jsonData) {
        _films.add(
          Film(
            id: item['id'],
            state: item['state'],
            author: item['author'],
            name: item['name'],
            description: item['description'],
            duration: item['duration'],
            videoUrl: domain + item['video_url'],
            coverPageUrl: domain + item['cover_page_url'],
            createdAt: item['created_at'],
            updatedAt: item['updated_at'],
            isFavorite: false,
          ),
        );
      }
      return _films;
    }
    return [];
  }
}

FilmsHttp filmsHttp = FilmsHttp();
