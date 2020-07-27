import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';
import 'package:vittamovie/app/modules/detail/model/MovieDetail.dart';
import 'package:vittamovie/app/shared/utils/ColorConstants.dart';
import 'package:vittamovie/app/shared/utils/SizeContants.dart';
import 'package:vittamovie/app/shared/utils/TextContants.dart';
import 'ChipGenereList.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetail detail;

  const MovieDetailAppBar({Key key, @required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
            width: double.infinity,
            child: LayoutBuilder(builder: (_, constraints) {
              return Column(
                children: <Widget>[
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    width: constraints.maxWidth,
                    padding: EdgeInsets.only(
                        left: SizeContants.normal, top: SizeContants.large),
                    height: constraints.maxHeight / 2,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: SizeContants.normalIconSize,
                          ),
                          onPressed: () {
                            //Modular.to.pushReplacementNamed("/");
                            Modular.to.pop();
                           // Navigator.pop(context);
                          }),
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 2,
                    padding: EdgeInsets.only(
                        left: SizeContants.normal, right: SizeContants.normal),
                    child: LayoutBuilder(builder: (_, constraintsBottom) {
                      return Column(children: <Widget>[
                        Container(
                          width: constraintsBottom.maxWidth,
                          height: constraintsBottom.maxHeight / 3,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Row(children: <Widget>[
                              Chip(
                                backgroundColor: ColorConstants.accentColor,
                                label: Text(detail.year),
                              ),
                              SizedBox(
                                width: SizeContants.normal,
                              ),
                              Chip(
                                backgroundColor: ColorConstants.accentColor,
                                label: Text(
                                    TextConstants.imdbText + detail.imdbRating,
                                    style: TextStyle(fontSize: SizeContants.textSizeBig)),
                              )
                            ]),
                          ),
                        ),
                        Expanded(child : Container(
                          width: constraintsBottom.maxWidth,
                          child: Text(
                            detail.title,
                            style:
                            TextStyle(fontSize: SizeContants.textTitleSize),
                          ),
                        )),
                        Container(
                          width: constraintsBottom.maxWidth,
                          height: constraintsBottom.maxHeight / 3,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: ChipGenereList(
                                generes: detail.genre.split(",")),
                          ),
                        )
                      ]);
                    }),
                  ),
                ],
              );
            }),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.black12,
                    blurRadius: 80.0,
                    offset: new Offset(5.0, 90.0),
                  ),
                ],
                color: Colors.black,
                image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.hue),
                    image: NetworkImage(detail.poster == "N/A" ? "https://parisdayhotel.com/assets/images/tn_noimage.png" : detail.poster),
                    fit: BoxFit.cover))));
  }
}
