import 'package:VittaChallenge/share_components/input/input.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final Object onChange;
  final String value;
  const Input({this.placeholder, this.onChange, this.value});

  @override
  State<StatefulWidget> createState() => _Input();
}

class _Input extends State<Input> {
  TextEditingController _controller;
  @override
  void initState() {
    _controller = new TextEditingController();
    _controller.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      input(widget.placeholder, _controller, widget.onChange, context);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
