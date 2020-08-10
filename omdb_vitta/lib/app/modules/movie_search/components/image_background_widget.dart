import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBackgroundWidget extends StatelessWidget {
  final String urlImage;

  const ImageBackgroundWidget({Key key, @required this.urlImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: urlImage,
          imageBuilder: (context, provider) {
            return Image(image: provider, fit: BoxFit.cover);
          },
        ),
        Container(color: Color(0xaa000000)),
      ],
    );
  }
}
