import 'package:flutter/material.dart';
import 'package:movies/components/card_info_movie.dart';
import 'package:movies/models/movie_info.dart';

class MovieDetails extends StatelessWidget {
  final MovieInfo movie;

  const MovieDetails({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (movie.poster == 'N/A') {
      movie.poster =
          'https://us.123rf.com/450wm/urfandadashov/urfandadashov1809/urfandadashov180901275/109135379-photo-not-available-vector-icon-isolated-on-transparent-background-photo-not-available-logo-concept.jpg?ver=6';
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detalhes do filme'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Center(
              child: Card(
                elevation: 5,
                child: Container(
                  height: 350,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie.poster),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              movie.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardInfo(
                  iconName: Icons.timer,
                  title: movie.runtime,
                ),
                CardInfo(
                  iconName: Icons.calendar_today,
                  title: movie.year,
                ),
                CardInfo(
                  iconName: Icons.star_border,
                  title: movie.imdbRating,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              movie.plot,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_circle_outline,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Ver o trailer',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
