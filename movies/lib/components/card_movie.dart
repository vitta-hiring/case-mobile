import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class CardMovie extends StatelessWidget {
  final Movie movie;
  const CardMovie({this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(movie.poster),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,   
                    overflow: TextOverflow.ellipsis,  
                    maxLines: 3,             
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 240,
                    child: Text(movie.year,
                        maxLines: 5, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
