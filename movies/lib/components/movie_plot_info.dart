import 'package:flutter/material.dart';

class MoviePlotInfo extends StatelessWidget {
  const MoviePlotInfo({
    @required this.plot,
    Key key,
  }) : super(key: key);
  final String plot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sinopse:',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            plot,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
