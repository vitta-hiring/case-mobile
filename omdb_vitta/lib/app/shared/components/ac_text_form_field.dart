import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/search_store.dart';

class ACTextFormField extends StatefulWidget {
  final SearchStore searchStore;
  final bool enableFormField;
  final Function onTap;
  final Function(String) onChanged;
  final bool autoFocus;

  const ACTextFormField({
    Key key,
    @required this.searchStore,
    @required this.enableFormField,
    @required this.onTap,
    @required this.onChanged,
    @required this.autoFocus,
  }) : super(key: key);
  @override
  _ACTextFormFieldState createState() => _ACTextFormFieldState();
}

class _ACTextFormFieldState extends State<ACTextFormField> {
  @override
  Widget build(BuildContext context) {
    double _widthSize = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: _widthSize,
        height: _widthSize * 0.15,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: Observer(builder: (_) {
              return TextFormField(
                onChanged: widget.onChanged,
                enabled: widget.enableFormField,
                autofocus: widget.autoFocus,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Digite o nome ${widget.searchStore.searchType == "movie" ? "do filme" : "da série"}",
                  hintStyle: TextStyle(fontSize: 15),
                  filled: true,
                  fillColor: Colors.grey[300],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                cursorColor: Colors.grey[500],
              );
            }),
          ),
        ),
      ),
    );
  }
}
