import 'package:flutter/material.dart';

class SinopseWidget extends StatelessWidget {
  SinopseWidget(this.overview);
  final String overview;

  @override
  Widget build(BuildContext context) {    
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sinopse',
          style: textTheme.subhead.copyWith(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Text(
          overview,
          style: textTheme.body1.copyWith(
            color: Colors.black45,
            fontSize: 16.0,
          ),
        ),
       
        
      ],
    );
  }
}
