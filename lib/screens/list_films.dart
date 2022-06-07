import 'package:films/db/favoriteFilm.dart';
import 'package:films/models/film.dart';
import 'package:films/screens/video_screen.dart';
import 'package:films/theme/my_theme.dart';
import 'package:flutter/material.dart';

class ListFilms extends StatefulWidget {
  final List<Film> films;
  const ListFilms({Key? key, required this.films}) : super(key: key);

  @override
  State<ListFilms> createState() => _ListFilmsState();
}

class _ListFilmsState extends State<ListFilms> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.films.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return VideoScreen(
                        film: widget.films[index],
                      );
                    },
                  ),
                );
              });
            },
            onDoubleTap: () {
              setState(() {
                widget.films[index].isFavorite
                    ? favoriteFilms.deleteFavoriteFilm(widget.films[index])
                    : favoriteFilms.addFavoriteFilm(widget.films[index]);
                widget.films[index].isFavorite =
                    !widget.films[index].isFavorite;
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0X9FFFFFFF)),
                    color: MaterialColor(0XFF000000, myColors),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Color(0XFFFFFFFF),
                          offset: Offset(1.0, 1.0),
                          blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.films[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0)),
                          Column(
                            children: <Widget>[
                              const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0)),
                              _favIcon(widget.films[index]),
                            ],
                          ),
                          // Column(
                          //   children: <Widget>[
                          //     SizedBox(
                          //       height: 50.0,
                          //       width: 50.0,
                          //       child: Image.network(
                          //           widget.films[index].coverPageUrl),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _favIcon(Film film) {
    return Icon(
      film.isFavorite ? Icons.favorite : Icons.favorite_border,
      color: film.isFavorite ? Colors.red : Colors.grey,
    );
  }
}
