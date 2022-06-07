class Film {
  final dynamic id;
  final dynamic state;
  final dynamic author;
  final dynamic name;
  final dynamic description;
  final dynamic duration;
  final dynamic videoUrl;
  final dynamic coverPageUrl;
  final dynamic createdAt;
  final dynamic updatedAt;
  bool isFavorite;

  Film({
    required this.id,
    required this.state,
    required this.author,
    required this.name,
    required this.description,
    required this.duration,
    required this.videoUrl,
    required this.coverPageUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavorite,
  });
}
