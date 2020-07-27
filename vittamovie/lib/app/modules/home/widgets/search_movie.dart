import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:vittamovie/app/shared/utils/Constants.dart';
import 'package:vittamovie/app/shared/utils/TextContants.dart';

class SearchMovie extends StatelessWidget {
  const SearchMovie({ Key key,this.onSubmitted}) : super(key: key);

  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    String key;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: TextEditingController(text: key),
          style: TextStyle(fontSize: 16),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              hintText: TextConstants.searchHint,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          onSubmitted: onSubmitted,
          onChanged: (text) {
            key = text;
          },
        ));
  }
}