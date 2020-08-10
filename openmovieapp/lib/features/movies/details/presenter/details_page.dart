import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:openmovieapp/features/movies/details/domain/entities/details.dart';
import 'package:openmovieapp/features/movies/details/domain/erros/erros.dart';
import 'package:openmovieapp/features/movies/details/presenter/details_cubit.dart';
import 'package:openmovieapp/features/movies/details/presenter/states/details_state.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  final String post;
  final String title;
  DetailsPage({Key key, @required this.id, this.post, this.title})
      : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.instance.get<DetailsCubit>();
    cubit.add(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  Widget _buildAdditionalBody(Details details) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.imdb,
                size: 36,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                details.imdbRating,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            details.plot,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                      color: Colors.black12,
                      image: DecorationImage(
                        image: NetworkImage(widget.post),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        StreamBuilder<DetailsState>(
                            stream: cubit,
                            builder: (context, snapshot) {
                              var state = cubit.state;

                              if (state is ErrorState) {
                                return _buildError(state.error);
                              }

                              if (state is LoadingState) {
                                return Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  ],
                                );
                              } else if (state is SuccessState) {
                                return _buildAdditionalBody(state.details);
                              } else {
                                return Container();
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                )
              ],
            )
          ],
        ));
  }
}
