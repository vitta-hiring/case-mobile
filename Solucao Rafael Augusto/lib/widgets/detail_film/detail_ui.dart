import 'package:VittaChallenge/share_components/custom_scaffold/custom_scaffold.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body_detail.dart';
import 'components/header.dart';

class DetailUI extends GetView<DetailController> {
  final String idFilm;

  const DetailUI({Key key, this.idFilm}) : super(key: key);

  onBuild(String id) => Get.find<DetailController>().setDetailFilm(id);

  @override
  Widget build(BuildContext context) {
    onBuild(idFilm);
    return CustomScaffold(
      children: Obx(
        () => controller.getDetailFilm == null
            ? Container()
            : NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) =>
                        <Widget>[header(context, controller.getDetailFilm)],
                body: detailBody(controller.getDetailFilm),
              ),
      ),
    );
  }
}
