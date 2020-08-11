import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movietta/app/pages/home/home_controller.dart';
import 'package:movietta/app/shared/models/movie_model.dart';
import 'package:movietta/app/widgets/movie_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  List<MovieModel> list = [];
  int initialPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'MoVietta',
          style: GoogleFonts.lekton(color: Colors.deepPurple, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black87,
      body: Observer(
        builder: (_) {
          if (homeController.movies.error != null) {
            return Center(
              child: Text('Sem Filmes'),
            );
          }
          if (homeController.movies.value == null) {
            return Center(
              child: SpinKitWanderingCubes(
                color: Colors.deepPurple,
              ),
            );
          }
          list.addAll(homeController.movies.value);
          return Center(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 600,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: initialPage,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    MovieCard(list[index]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 70,
            color: Colors.white,
          ),
          onTap: () {
            initialPage = list.length - 1;
            homeController.fetchMore();
          },
        ),
      ),
    );
  }
}

// Modular.to.pushNamed('/detail');
