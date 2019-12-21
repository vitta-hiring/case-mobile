import 'package:flutter/material.dart';
import 'package:movie_app/app/models/movie_detail_model.dart';

class RateWidget extends StatelessWidget {
  RateWidget(this.movie);
  final MovieDetailModel movie;

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

    for (var i = 1; i <= 10; i++) {
      var color = i <= movie.vote_average ? theme.accentColor : Colors.black12;
      var star = Icon(
        Icons.movie,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    
    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingBar(theme),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4.0),
          child:Text(
          movie.vote_average.toString() + "/10" ,
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor,
          ),
        ),
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        starRating,
      ],
    );
  }
}
