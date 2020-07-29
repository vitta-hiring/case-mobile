class MovieModel {
  final String title;
  final int year;
  final String imdbID;
  final String type;
  final String poster;

  MovieModel({
    this.title,
    this.year,
    this.imdbID,
    this.poster,
    this.type,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json['Title'],
        year: int.parse(json['Year']),
        imdbID: json['imdbID'],
        type: json['Type'],
        poster: json['Poster'],
      );

  Map<String, dynamic> toJson() => {
        'Title': this.title,
        'Year': this.year.toString(),
        'imdbID': this.imdbID,
        'Type': this.type,
        'Poster': this.poster,
      };

  bool operator ==(other) {
    return (other is MovieModel &&
        other.title == title &&
        other.year == year &&
        other.imdbID == imdbID &&
        other.type == type &&
        other.poster == poster);
  }

  @override
  int get hashCode => super.hashCode;
}
