import 'package:VittaChallenge/share_components/custom_scaffold/float_button.dart';
import 'package:VittaChallenge/share_components/load/load_spinner.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget children;
  final bool iconClose;
  final bool iconBack;
  final bool floatButton;
  final Object onClick;
  final double safeArea;

  const CustomScaffold({
    Key key,
    this.title,
    this.children,
    this.iconClose,
    this.iconBack,
    this.floatButton,
    this.onClick,
    this.safeArea,
  }) : super(key: key);

  Widget scaffold(BuildContext context) => Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false, // set it to false

        // appBar: customAppBar(
        //   context: context,
        //   title: title,
        //   iconClose: iconClose,
        //   iconback: iconBack,
        // ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          minimum: EdgeInsets.all(safeArea == null ? 0 : safeArea),
          child: Container(
            child: children,
          ),
        ),
        floatingActionButton:
            floatButton == true ? floatActionButton(onClick) : Container(),
      );

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          scaffold(context),
          LoadSpinner(),
        ],
      );
}
