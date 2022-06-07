import 'package:chewie/chewie.dart';
import 'package:films/models/film.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayItemScreen extends StatefulWidget {
  final Film film;
  final VideoPlayerController videoPlayerController;
  final bool looping;
  const PlayItemScreen(
      {Key? key,
      required this.film,
      required this.videoPlayerController,
      required this.looping})
      : super(key: key);

  @override
  _PlayItemScreenState createState() => _PlayItemScreenState();
}

class _PlayItemScreenState extends State<PlayItemScreen> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16 / 9,
        autoPlay: true,
        looping: widget.looping,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
