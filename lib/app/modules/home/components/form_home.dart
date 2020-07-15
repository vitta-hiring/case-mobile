import 'package:filme/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormHome extends StatefulWidget {
  @override
  _FormHomeState createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  // Chave de controle do formulário (para validação)
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Controlador da Home
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      // Chave de controle
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Campos de preenchimento
          TextFormField(
              controller: homeController.textName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Título do Filme *',
                labelStyle: TextStyle(
                  fontSize: 17.0,
                ),
                alignLabelWithHint: true,
              ),
              style: TextStyle(color: Colors.black54, fontSize: 20.0),
              textAlign: TextAlign.left,
              // Validação do nome (para não fazer busca vazia)
              validator: (value) {
                if (value.isEmpty) {
                  return "Insira o nome!";
                }
                return null;
              }),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 20.0),
                    child: TextFormField(
                        controller: homeController.textYear,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ano',
                          labelStyle: TextStyle(
                            fontSize: 17.0,
                          ),
                          alignLabelWithHint: true,
                        ),
                        style: TextStyle(color: Colors.black54, fontSize: 20.0),
                        textAlign: TextAlign.left,
                        // Validação do campo (para permitir, caso o ano seja
                        // preenchido, apenas anos válidos entre 0 e 2020)
                        validator: (value2) {
                          if (value2.isNotEmpty) {
                            if (double.parse(value2) <= 0.0 ||
                                double.parse(value2) >= 2021.0) {
                              return "Ano inválido!";
                            }
                          }
                          return null;
                        }),
                  ),
                ),
                // Criação do botão personalizado
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        // Ações ao pressionar o botão
                        onPressed: () {
                          // Ao ser pressionado, os campos de texto perdem o foco
                          FocusScope.of(context).requestFocus(FocusNode());
                          // Validação e chamada do controlador
                          if (_formKey.currentState.validate()) {
                            homeController.fechtFilms();
                          }
                        },
                        // Estilização do botão
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.lightBlue, Colors.blueAccent],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Text(
                                    "Buscar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
