class MovieDetail {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imdbRating;
  final String production;

  MovieDetail({this.title, this.year, this.rated, this.released, this.runtime,this.genre,this.director,this.writer,this.actors,
  this.plot,this.language,this.country,this.awards,this.poster,this.metascore,this.imdbRating,this.production});

  factory MovieDetail.fromJson(Map<dynamic, dynamic> json) {
    return MovieDetail(
      title: json['Title'],
      year: json['Year'],
      rated: json['Rated'],
      released: json['Released'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      director: json['Director'],
      writer: json['Writer'],
      actors: json['Actors'],
      plot: json['Plot'],
      language: json['Language'],
      country: json['Country'],
      awards: json['Awards'],
      poster: json['Poster'],
      metascore: json['Metascore'],
      imdbRating: json['imdbRating'],
      production: json['Production'],
    );
  }
}
