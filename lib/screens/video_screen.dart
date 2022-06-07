import 'package:films/db/films.dart';
import 'package:films/screens/list_films.dart';
import 'package:films/screens/play_item_screen.dart';
import 'package:films/models/film.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final Film film;
  const VideoScreen({Key? key, required this.film}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<Film> _films = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _films.addAll(filmsHttp.films);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.film.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 70.0,
              height: 40.0,
              child: Image.network(
                widget.film.coverPageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  PlayItemScreen(
                      film: widget.film,
                      videoPlayerController:
                          VideoPlayerController.network(widget.film.videoUrl),
                      looping: true),
                ],
              ),
            ),
            ListFilms(films: _films),
          ],
        ),
      ),
    );
  }
}
