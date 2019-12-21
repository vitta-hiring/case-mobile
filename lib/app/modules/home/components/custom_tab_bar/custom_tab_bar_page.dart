import 'package:flutter/material.dart';

class CustomTabBar extends Container implements PreferredSizeWidget {
  CustomTabBar(this.color, this.txtTab01, this.txtTab02, this.tabController);
  final Color color;
  final String txtTab01;
  final String txtTab02;
  final TabController tabController;
  @override
  //Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        height: 60.0,
        child: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          tabs: [
            Tab(
              text: txtTab01,
            ),
            Tab(
              text: txtTab02,
            ),
          ],
        ),
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => null;
}
