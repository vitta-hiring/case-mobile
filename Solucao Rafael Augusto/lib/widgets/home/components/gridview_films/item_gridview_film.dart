import 'package:VittaChallenge/models/film.dart';
import 'package:VittaChallenge/share_components/custom_text/custom_text.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_binding.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemGridViewFilm extends StatelessWidget {
  final Film film;

  const ItemGridViewFilm({Key key, this.film}) : super(key: key);

  onClick(String idFilm) => Get.to(
      DetailUI(
        key: Key('detailUi'),
        idFilm: idFilm,
      ),
      binding: DetailBinding(),
      transition: Transition.fade);

  Widget image(String src) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(src), fit: BoxFit.cover),
        ),
      );

  Widget title(String title) => Center(
        child: CustomText(
          text: title,
          color: Colors.white,
          size: 15,
          font: 'PoppinsExtraLight',
        ),
      );

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onClick(film.imdbID),
        child: Card(
          elevation: 2,
          color: film.poster != 'N/A' ? Colors.white : Colors.black,
          shadowColor: Colors.black,
          child: film.poster != 'N/A' ? image(film.poster) : title(film.title),
        ),
      );
}
