import 'package:VittaChallenge/models/detailFilm.dart';
import 'package:VittaChallenge/widgets/detail_film/components/gridview_details/item_gridview_detail.dart';
import 'package:flutter/material.dart';

class GridViewDetails extends StatelessWidget {
  final Detail detail;
  final msgNotFound = 'Não especificado';
  GridViewDetails({Key key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          width: double.infinity,
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              ItemGridViewDetail(
                iconData: Icons.movie,
                title: "Gênero",
                info: detail?.genre != "N/A" ? detail.genre : msgNotFound,
              ),
              ItemGridViewDetail(
                iconData: Icons.speaker_notes,
                title: "Legendas",
                info: detail?.language != "N/A" ? detail.language : msgNotFound,
              ),
              ItemGridViewDetail(
                iconData: Icons.location_city,
                title: "Países",
                info: detail?.country != "N/A" ? detail.country : msgNotFound,
              ),
              ItemGridViewDetail(
                iconData: Icons.star,
                title: "Prêmios",
                info: detail?.awards != "N/A" ? detail.awards : msgNotFound,
              ),
              ItemGridViewDetail(
                iconData: Icons.calendar_today,
                title: "Lançamento",
                info: detail?.released != 'N/A' ? detail.released : msgNotFound,
              ),
              ItemGridViewDetail(
                  iconData: Icons.score,
                  title: "Pontuação",
                  info: detail?.metascore != "N/A"
                      ? detail.metascore
                      : msgNotFound),
              ItemGridViewDetail(
                iconData: Icons.insert_chart,
                title: "Total de votos",
                info:
                    detail?.imdbVotes != 'N/A' ? detail.imdbVotes : msgNotFound,
              ),
              ItemGridViewDetail(
                  iconData: Icons.attach_money,
                  title: "Bilheteria",
                  info: detail.boxOffice != 'N/A'
                      ? detail.boxOffice
                      : msgNotFound),
            ],
          ),
        ),
      );
}
