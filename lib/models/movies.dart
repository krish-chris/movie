class Movie{
  final int id;
  final String movie;
  final double rating;
  final String image;
  final String imdb_url;

  Movie({
    required this.id,
    required this.movie,
    required this.rating,
    required this.image,
    required this.imdb_url
  });

  factory Movie.fromMap(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      movie: json['movie'],
      rating: json['rating'].toDouble(),
      image: json['image'],
      imdb_url: json['imdb_url'],
    );
  }
}