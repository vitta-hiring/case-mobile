import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/list_movie_controller.dart';
import '../../core/Components/action_button.dart';
import '../../core/consts/consts_colors.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: GetBuilder<ListMovieController>(
            init: ListMovieController(),
            builder: (controller) {
              if (Get.arguments != null) {
                controller.getSearchIdMovie(Get.arguments);
                if (controller.movieDetails == null ||
                    controller.movieDetails.response == "False") {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: Get.height * 0.50,
                        child: Hero(
                          tag: Get.arguments,
                          child: CachedNetworkImage(
                            imageUrl: controller.movieDetails.poster,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: Get.height * 0.50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Theme.of(context).primaryColor
                            ],
                          ),
                        ),
                        child: Center(
                          child: AnimatedSize(
                            duration: Duration(milliseconds: 200),
                            vsync: this,
                            curve: Curves.bounceIn,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 7,
                                      offset: Offset(0, 6),
                                      color: Colors.black.withOpacity(0.5),
                                    )
                                  ],
                                  color: ConstsColors.blueDark,
                                  borderRadius: BorderRadius.circular(100)),
                              child: GestureDetector(
                                  onTap: () => controller.changePlayerButton(),
                                  child: controller.playerButton),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Get.back(),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(top: Get.height * 0.35),
                              width: Get.width * 0.70,
                              height: Get.height * 0.15,
                              decoration: BoxDecoration(
                                color: ConstsColors.blueAccept,
                                boxShadow: [
                                  BoxShadow(
                                    color: ConstsColors.blueAccept,
                                    blurRadius: 7,
                                    offset: Offset(0, 4),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 33,
                                            ),
                                          ),
                                          TextSpan(
                                              text: controller
                                                  .movieDetails.imdbRating,
                                              style: TextStyle(fontSize: 20))
                                        ]),
                                      ),
                                      Text(
                                        'Nota IMDb.',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.timer,
                                              color: Colors.amber,
                                              size: 33,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                controller.movieDetails.runtime,
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                      ),
                                      Text(
                                        'Duração',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    controller.movieDetails.title,
                                    style: TextStyle(
                                      color: ConstsColors.blueDark,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Data de lançamento ${controller.movieDetails.year}',
                                    style: TextStyle(
                                      color: ConstsColors.blueDark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ActionButton(
                                    text: controller.movieDetails.type,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Sinopse',
                                    style: TextStyle(
                                      color: ConstsColors.blueDark,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 10),
                                    child: Text(
                                      controller.movieDetails.plot,
                                      style: TextStyle(
                                          color: ConstsColors.blueDark
                                              .withOpacity(0.8)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
