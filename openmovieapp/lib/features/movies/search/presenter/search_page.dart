import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openmovieapp/features/movies/details/presenter/details_page.dart';
import 'package:openmovieapp/features/movies/search/domain/entities/search_result.dart';
import 'package:openmovieapp/features/movies/search/domain/erros/erros.dart';
import 'search_cubit.dart';
import 'states/search_state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.instance.get<SearchCubit>();
  }

  Widget _buildList(List<SearchResult> list) {
    return ListView.separated(
      itemCount: list.length,
      padding: EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 50),
      separatorBuilder: (context, index) => SizedBox(
        height: 50,
      ),
      itemBuilder: (_, index) {
        var item = list[index];
        return Container(
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(id: item.imdbID,post: item.poster,title: item.title,),
                ),
              );
            },
            child: Container(
              height: 400,
              child: Container(
                  child: Center(
                    child: item.poster == 'N/A' ? Text(item.title) : Text(''),
                  )),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  image: DecorationImage(
                    image: NetworkImage(item.poster),
                    fit: BoxFit.fill,
                  ),

                  borderRadius: BorderRadius.all(
                    const Radius.circular(50.0),
                  )),
            ),
          )
        );
      },
    );
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorSearch) {
      return Center(
        child: Text('Erro ao recuperar dados'),
      );
    } else {
      return Center(
        child: Text('Erro interno'),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 16, top: 24, right: 16, left: 16),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      onChanged: cubit.addSearch,
                      decoration: InputDecoration(
                          hintText: 'procurar', border: InputBorder.none),
                      // onChanged: onSearchTextChanged,
                    ),
                  ),
                ),
              )),
          Expanded(
            child: StreamBuilder<SearchState>(
                stream: cubit,
                builder: (context, snapshot) {
                  var state = cubit.state;

                  if (state is ErrorState) {
                    return _buildError(state.error);
                  }

                  if (state is StartState) {
                    return Center(
                      child: Text('Dita um filme que vc gosta em ingles plis '),
                    );
                  } else if (state is LoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SuccessState) {
                    return _buildList(state.list);
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }
}
