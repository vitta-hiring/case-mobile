import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vittamovie/app/shared/utils/SizeContants.dart';

class ChipGenereList extends StatelessWidget {
  final List<String> generes;

  const ChipGenereList({Key key, @required this.generes})
      : super(key: key);

  List<Widget> _getGeneres() {
    List<Widget> chips = [];
    int i=0;
    if(generes != null && generes.length >0){
      generes.forEach((element) {
        if(i <=3){
          var chp = Chip(
            label: Text(element),
          );
          var sizeBox = SizedBox(
            width: SizeContants.mini,
          );
          chips.add(chp);
          chips.add(sizeBox);
        }else{
          return chips;
        }
        i++;
      });
      return chips;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _getGeneres()
    );
  }
}