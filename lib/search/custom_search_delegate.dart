import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) { //Define o botão de voltar

    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, "");
        },
      );
  }

  /* Captura o texto de pesquisa e repassa para classe chamadora */
  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  /* Este método é chamado toda vez q se digitar algo */
  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> sugestoesPesquisa = List();

    if (query.isNotEmpty) {
      sugestoesPesquisa = [
        "Layton Lake", "Hirshfelden",
        "Cuatro Colinas", "Silver Ridge Peaks",
        "Vuhonga Savana", "Yukon Valley",
        "Parque Fernando", "Medved Taiga"]
          .where((texto) =>
          texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
          itemCount: sugestoesPesquisa.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, sugestoesPesquisa[index]);
              },
              title: Text(sugestoesPesquisa[index]),
            );
          }
      );
    } else {
      return Center(
        child: Text('Nenhum resultado.'),
      );
    }
  }
}