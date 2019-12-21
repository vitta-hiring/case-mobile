import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/models/movie_detail_model.dart';
import 'package:movie_app/app/models/movie_model.dart';
import 'package:movie_app/app/modules/detail/detail_page.dart';
import 'package:movie_app/app/modules/home/components/movie_tile/movie_tile_widget.dart';
import 'package:movie_app/app/modules/home/home_controller.dart';
import 'package:movie_app/app/modules/home/home_module.dart';

class TopPopularityTabPage extends StatefulWidget {
  final String title;
  const TopPopularityTabPage({Key key, this.title = "TopPopularityTab"})
      : super(key: key);

  @override
  _TopPopularityTabPageState createState() => _TopPopularityTabPageState();
}

class _TopPopularityTabPageState extends State<TopPopularityTabPage> {
  final controller = HomeModule.to.bloc<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (_, int index) {
            MovieModel model = controller.list[index];
            if (index < controller.list.length - 1) {
              return MovieTileWidget(
                  model: model,
                  onPressed: () {
                    goToDetails(model.id);
                  });
            } else {
              controller.searchVideos(null);
              return Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              );
            }
          },
        );
      },
    );
  }

  Future<void> goToDetails(int id) async {
    MovieDetailModel movieDetail = await controller.listMovie(id);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(model: movieDetail)),
    );
  }
}
