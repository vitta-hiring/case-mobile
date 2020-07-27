class Movie {

  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  Movie({this.title, this.year,this.imdbID,this.type,this.poster});

  factory Movie.fromJson(Map<dynamic, dynamic> json) {
    return Movie(
        title: json['Title'],
        year: json['Year'],
        imdbID: json['imdbID'],
        type: json['Type'],
        poster: json['Poster'],
    );
  }
}