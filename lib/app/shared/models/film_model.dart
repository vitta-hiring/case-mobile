// Modelo para as infos resumidas do filme mostradas no card

class FilmModel {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;
  String error;

  FilmModel(
      {this.title, this.year, this.imdbID, this.type, this.poster, this.error});

  FilmModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    data['Error'] = this.error;
    return data;
  }
}
