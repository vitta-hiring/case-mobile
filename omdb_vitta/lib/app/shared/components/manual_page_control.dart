import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ManualPageControl extends StatefulWidget {
  final List<Widget> items;
  final List<Widget> titles;
  final CarouselController controller;
  final Function(int, CarouselPageChangedReason) onPageChanged;

  const ManualPageControl({
    Key key,
    this.items,
    this.titles,
    this.controller,
    this.onPageChanged,
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
          return Container(
            margin: EdgeInsets.all(5.0),
            // color: Colors.purple,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    // color: Colors.pink,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: widget.titles[e.key],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // color: Color(0x20000000),
                        // border: Border.all(width: 2.0),
                        ),
                    child: e.value,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: (9 / 16),
          initialPage: 0,
          enlargeCenterPage: true,
          viewportFraction: 0.75,
          enableInfiniteScroll: false,
          onPageChanged: widget.onPageChanged,
        ),
        carouselController: widget.controller,
      ),
    );
  }
}
