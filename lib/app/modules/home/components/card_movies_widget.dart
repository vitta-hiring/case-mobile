import 'package:filme/app/modules/home/components/popup_card.dart';
import 'package:flutter/material.dart';

class CardMovies extends StatefulWidget {
  final String titleCard;
  final String yearCard;
  final String posterCard;
  final String imdbIDCard;

  // Construtor do card
  CardMovies([this.titleCard, this.posterCard, this.yearCard, this.imdbIDCard]);

  @override
  _CardMoviesState createState() => _CardMoviesState();
}

class _CardMoviesState extends State<CardMovies> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Card(
            // Personalização do card
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              // Quando o card é pressionado, a função é chamada
              onTap: () => _onPressedCard(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150.0,
                        maxWidth: 100.0,
                        minHeight: 150.0,
                        minWidth: 100.0,
                      ),
                      // Personalização do poster do card
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network("${widget.posterCard}",
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Flexible(
                    // Personalização do título e ano do card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Text("${widget.titleCard}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 19.0)),
                        Row(
                          children: <Widget>[
                            Text("${widget.yearCard}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 15.0)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Função acionada ao clicar no botão
  void _onPressedCard() {
    // Criação de uma Modal Bottom Sheet
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          // Definição do tamanho da tela e decoração
          return FractionallySizedBox(
            heightFactor: 0.79,
            child: Container(
              color: Color(0xFF7b7b7b),
              child: Container(
                child: PopUpCard(
                    widget.titleCard, widget.yearCard, widget.imdbIDCard),
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
