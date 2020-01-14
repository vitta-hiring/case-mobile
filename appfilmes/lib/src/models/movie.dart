class Movie {
  final String title;
  final int year;
  final String imdbID;
  final String posterUrl;

  String released;
  String genre;
  String plot;
  String imdbRating;

  Movie({this.title, this.year, this.imdbID, this.posterUrl, this.released, this.genre, this.plot, this.imdbRating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] as String,
      year: int.parse(json['Year']),
      imdbID: json['imdbID'] as String,
      posterUrl: json['Poster'] as String,
    );
  }

  factory Movie.fromJsonFull(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] as String,
      year: int.parse(json['Year']),
      imdbID: json['imdbID'] as String,
      posterUrl: json['Poster'] as String,
      released: json['Released'] as String,
      genre: json['Genre'] as String,
      plot: json['Plot'] as String,
      imdbRating: json['imdbRating'] as String,
    );
  }
}