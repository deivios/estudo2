import 'package:estudo2/Widgets/core/default_dialog_container.dart';
import 'package:estudo2/controllers/pessoa_controller.dart';
import 'package:estudo2/extensions/extensions.dart';
import 'package:estudo2/models/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PessoaDialog extends StatelessWidget {
  final Pessoa pessoa;
  const PessoaDialog({super.key, required this.pessoa});

  @override
  Widget build(BuildContext context) {
    final pessoaController = GetIt.instance.get<PessoaController>();
    return AlertDialog(
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: []),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                pessoaController.removerPessoa(pessoa);
                Navigator.of(context).pop();
              },
              child: Text("Excluir", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fechar", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ],
      content: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informações do usuário"),
            SizedBox(height: 8),
            DefaultDialogContainer(child: DefaultDialogContainer(child: Text("Id: ${pessoa.id}"))),
            DefaultDialogContainer(child: Text("Nome: ${pessoa.nome}")),
            DefaultDialogContainer(child: Text("Peso: ${pessoa.peso.paraPeso()}")),
            DefaultDialogContainer(child: Text("altura: ${pessoa.altura.paraAltura()}")),
          ],
        ),
      ),
    );
  }
}
