import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:vitta_test/app/modules/movie_list/movie_list_module.dart';
import 'package:vitta_test/app/modules/movie_list/omdb_service.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<ModuleWidget> modules;

  @override
  void initState() {
    this._tabController = TabController(length: 3, vsync: this);
    this.modules = [
      MovieListModule(
        type: OMDB_MOVIE_SEARCH_TYPE,
      ),
      MovieListModule(
        type: OMDB_SERIES_SEARCH_TYPE,
      ),
      MovieListModule(
        type: OMDB_EPISODE_SEARCH_TYPE,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: this.modules.length,
        child: TabBarView(
          controller: this._tabController,
          children: this.modules,
        ),
      ),
    );
  }
}
