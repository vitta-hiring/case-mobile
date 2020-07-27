import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vittamovie/app/modules/detail/widgets/MovieDetailAppBar.dart';
import 'package:vittamovie/app/shared/utils/SizeContants.dart';
import 'package:vittamovie/app/shared/utils/TextContants.dart';

import 'detail_controller.dart';
import 'model/MovieDetail.dart';
import 'widgets/AboutItem.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({Key key, @required this.id})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    controller.findById(widget.id);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var appBarHeight = height * 40 / 100;
    var top = MediaQuery.of(context).padding.top;
    return Observer(builder: (_) {
      if (controller.movieDetail.error != null) {
        return Center(
            child: RaisedButton(
          child: Text(TextConstants.refresh),
          onPressed: controller.findById(widget.id),
        ));
      }
      if (controller.movieDetail.value == null) {
        return Center(child: CircularProgressIndicator());
      } else {
        var detail = controller.movieDetail.value;
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: MovieDetailAppBar(detail : detail),
            ),
            body: SingleChildScrollView(
              child: LayoutBuilder(builder: (_, constraintsBody) {
                return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeContants.normal),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Column(children: <Widget>[
                            SizedBox(height: SizeContants.normal),
                            Row(children: <Widget>[
                              Text(TextConstants.synopsis,
                                  style: TextStyle(
                                      fontSize: SizeContants.textTitleSize))
                            ]),
                            SizedBox(height: SizeContants.normal),
                            Text(detail.plot,
                                style: TextStyle(
                                    fontSize: SizeContants.textSizeNormal,
                                    color: Colors.grey)),
                            SizedBox(height: SizeContants.normal),
                            Row(children: <Widget>[
                              Text(TextConstants.about,
                                  style: TextStyle(
                                      fontSize: SizeContants.textTitleSize))
                            ]),
                            SizedBox(height: SizeContants.normal),
                            AboutItem(label :TextConstants.title,value : detail.title),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.year,value : detail.year),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.rated,value : detail.rated),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.released,value : detail.released),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.runtime,value : detail.runtime),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.genre,value : detail.genre),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.director,value : detail.director),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.writer,value : detail.writer),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.actors,value : detail.actors),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.language,value : detail.language),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.country,value : detail.country),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.awards,value : detail.awards),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.metascore,value : detail.metascore),
                            SizedBox(height: SizeContants.micro),
                            AboutItem(label :TextConstants.imdbRating,value : detail.imdbRating),
                            SizedBox(height: SizeContants.micro),
                          ]),
                        ),
                      ],
                    ));
              }),
            ));
      }
    });
  }
}
