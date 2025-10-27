import 'package:estudo2/Widgets/custom_person_tile.dart';
import 'package:estudo2/models/pessoa.dart';
import 'package:flutter/material.dart';

class ListaPessoa extends StatelessWidget {
  final List<Pessoa> pessoas;
  final void Function(Pessoa pessoa) onDeletePessoa;
  const ListaPessoa({
    super.key,
    required this.pessoas,
    required this.onDeletePessoa,
  });

  @override
  Widget build(BuildContext context) {
    if (pessoas.isEmpty) {
      return Center(
        child: Text(
          "Nenhuma Pessoa Cadastrada",
          style: TextStyle(fontSize: 20),
        ),
      );
    }
    return ListView.builder(
      itemCount: pessoas.length,
      itemBuilder: (context, index) {
        return CustomPersonTile(
          pessoa: pessoas[index],
          onDeletePessoa: onDeletePessoa,
        );
      },
    );
  }
}
