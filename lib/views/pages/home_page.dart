import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/Components/list_view_action_button.dart';
import '../../core/consts/consts_colors.dart';
import '../../core/consts/consts_images.dart';
import '../../views/widgets/cards_movies.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController inputSearchMovie = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Bem vindo!\nPesquise aqui seus\nFilmes favoritos.',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
                  ),
                  Container(
                    width: Get.width * 0.20,
                    height: Get.width * 0.20,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        ConstsImages.avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: Get.height * 0.10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                          color: ConstsColors.blueAccept,
                          blurRadius: 6,
                          offset: Offset(1, 1))
                    ]),
                child: TextFormField(
                  controller: inputSearchMovie,
                  showCursor: false,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Buscar filme',
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: ConstsColors.blueAccept,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListViewActionButton(),
            ),
            SizedBox(height: 10),
            CardMovies(inputSearchMovie: inputSearchMovie)
          ],
        ),
      ),
    );
  }
}
