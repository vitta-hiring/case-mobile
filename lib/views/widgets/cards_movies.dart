import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/list_movie_controller.dart';
import '../../core/consts/consts_colors.dart';
import '../../core/consts/consts_images.dart';
import '../../views/pages/movie_details_page.dart';

class CardMovies extends StatelessWidget {
  final TextEditingController inputSearchMovie;

  const CardMovies({Key key, this.inputSearchMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListMovieController>(
        init: ListMovieController(),
        builder: (controller) {
          inputSearchMovie.addListener(() {
            controller.getSearchMovie(inputSearchMovie.text);
          });
          if (inputSearchMovie.text.isEmpty && controller.response != true) {
            controller.getSearchMovie('The Avengers');
          }
          if (controller.response != null && !controller.response) {
            return Padding(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    ConstsImages.erroImage,
                    height: Get.height * 0.25,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Que pena não encontramos, verifique sua conexão, ou tente outro nome.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ConstsColors.blueDark,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
            );
          } else if (controller.searchMovies == null ||
              controller.searchMovies.isEmpty) {
            return CircularProgressIndicator();
          } else {
            return CarouselSlider(
              options: CarouselOptions(
                height: Get.height * 0.43,
                viewportFraction: 0.6,
              ),
              items: controller.searchMovies.map<Widget>((m) {
                return GestureDetector(
                  onTap: () async {
                    await Get.to(MovieDetails(), arguments: m.imdbID);
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ConstsColors.blueAccept.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 6,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ]),
                    height: Get.height * 0.70,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Hero(
                              tag: m.imdbID,
                              child: CachedNetworkImage(
                                imageUrl: m.poster,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: ConstsColors.blueLight,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  ConstsImages.erroImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                ConstsColors.blueDark
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                m.title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
        });
  }
}
