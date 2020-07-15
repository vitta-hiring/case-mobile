// Model para os detalhes do filme que aparecem ao clicar

class DetailsModel {
  String imdbID;
  String type;
  String imdbRating;
  String error;
  String genre;
  String director;
  String plot;

  DetailsModel(
      {this.imdbID,
      this.type,
      this.imdbRating,
      this.error,
      this.genre,
      this.director,
      this.plot});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    imdbID = json['imdbID'];
    type = json['Type'];
    imdbRating = json['imdbRating'];
    error = json['Error'];
    genre = json['Genre'];
    director = json['Director'];
    plot = json['Plot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['imdbRating'] = this.imdbRating;
    data['Error'] = this.error;
    data['Genre'] = this.genre;
    data['Director'] = this.director;
    data['Plot'] = this.plot;
    return data;
  }
}
