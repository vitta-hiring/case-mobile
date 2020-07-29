import 'package:flutter_test/flutter_test.dart';
import 'package:vitta_test/app/models/rating_model.dart';

void main() {
  final source = 'Rotten Tomatoes';
  final value = '38%';

  group('RatingModel test', () {
    test('Should return a RatingModel', () {
      RatingModel rating = RatingModel(source: source, value: value);
      expect(rating.source, source);
      expect(rating.value, value);
    });

    test('Should return a JSON RatingModel when object RatingModel is informed',
        () {
      RatingModel rating = RatingModel(source: source, value: value);
      Map ratingMap = rating.toJson();
      expect(rating.source, ratingMap['Source']);
      expect(rating.value, ratingMap['Value']);
    });

    test('Should return a RatingModel when JSON is informed', () {
      Map<String, dynamic> ratingMap = {'source': source, 'value': value};
      RatingModel rating = RatingModel.fromJson(ratingMap);
      expect(rating.source, ratingMap['Source']);
      expect(rating.value, ratingMap['Value']);
    });
  });
}
