import 'package:flutter/material.dart';
import 'package:movies/models/search_params.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class SearchForm extends StatefulWidget {
  SearchForm({
    this.scrollController,
    this.searchParams,
    Key key,
  }) : super(key: key);
  final ScrollController scrollController;
  final SearchParams searchParams;

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController titleController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();

  _updateTitle() {}

  @override
  void initState() {
    super.initState();
    titleController.addListener(_updateTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context, provider, _) => ListView(
        controller: widget.scrollController,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Título',
            ),
            onChanged: provider.updateTitle,
            controller: titleController,
            focusNode: titleFocusNode,
            onSubmitted: (_) => provider.searchMovies(),
            textInputAction: TextInputAction.search,
          ),
        ],
      ),
    );
  }
}
