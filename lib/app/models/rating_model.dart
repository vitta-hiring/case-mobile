class RatingModel {
  RatingModel({
    this.source,
    this.value,
  });

  String source;
  String value;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        source: json["Source"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Source": source,
        "Value": value,
      };
}
