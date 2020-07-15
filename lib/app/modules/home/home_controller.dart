import 'package:filme/app/shared/models/details_model.dart';
import 'package:filme/app/shared/models/film_model.dart';
import 'package:filme/app/shared/repositories/film_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  // Criação da variável de controle do repositório
  final FilmRepository repository;

  // Variáveis que serão atualizadas na tela, por isso precisam ser observadas
  @observable
  ObservableFuture<List<FilmModel>> films;
  ObservableFuture<DetailsModel> details;
  final textName = TextEditingController();
  final textYear = TextEditingController();

  // Construtor do controller
  _HomeControllerBase(this.repository) {
    fechtFilms();
  }

  // Método de busca pelo ID
  @action
  detailsFilms(String imdbID) {
    details = repository.getDetails(imdbID).asObservable();
  }

  // Método de busca pelo nome e ano
  @action
  fechtFilms() {
    films = repository
        .getFilms(textName.value.text, textYear.value.text)
        .asObservable();
  }
}
