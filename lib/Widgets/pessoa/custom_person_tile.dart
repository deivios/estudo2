import 'package:estudo2/Widgets/core/custom_tile.dart';
import 'package:estudo2/Widgets/pessoa/pessoa_dialog.dart';
import 'package:estudo2/extensions/extensions.dart';
import 'package:estudo2/models/pessoa.dart';
import 'package:flutter/material.dart';

class CustomPersonTile extends StatelessWidget {
  final Pessoa pessoa;

  const CustomPersonTile({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      title: pessoa.nome,
      subtitle: "Peso: ${pessoa.peso.paraPeso()} | Altura: ${pessoa.altura.paraAltura()}",
      icon: Icons.person,
      onTap: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return PessoaDialog(pessoa: pessoa);
          },
        );
      },
    );
  }
}
