import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ManualPageControl extends StatefulWidget {
  final List<Widget> items;
  final List<Widget> titles;
  final double height;
  final CarouselController controller;
  final Function(int, CarouselPageChangedReason) onPageChanged;
  final bool hasTitles;
  final Function onTapMovie;

  const ManualPageControl({
    Key key,
    this.items,
    this.titles,
    this.controller,
    this.onPageChanged,
    this.height,
    @required this.hasTitles,
    @required this.onTapMovie,
  }) : super(key: key);

  @override
  _ManualPageControlState createState() => _ManualPageControlState();
}

class _ManualPageControlState extends State<ManualPageControl> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: CarouselSlider(
        items: widget.items.asMap().entries.map((e) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                Spacer(),
              widget.hasTitles
                  ? Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: widget.titles[e.key],
                      ),
                    )
                  : SizedBox(),
              InkWell(
                onTap: widget.onTapMovie,
                child: Container(child: e.value),
              ),
                Spacer(),
            ],
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: (9 / 16),
          initialPage: 0,
          enlargeCenterPage: true,
          viewportFraction: 0.85,
          enableInfiniteScroll: false,
          onPageChanged: widget.onPageChanged,
          height: widget.height,
        ),
        carouselController: widget.controller,
      ),
    );
  }
}
