import 'package:estudo2/extensions/extensions.dart';
import 'package:estudo2/models/pessoa.dart';
import 'package:flutter/material.dart';

class Pessoalistile extends StatefulWidget {
  final Pessoa pessoa;

  const Pessoalistile({super.key, required this.pessoa});

  @override
  State<Pessoalistile> createState() => _PessoalistileState();
}

class _PessoalistileState extends State<Pessoalistile> {
  @override
  void initState() {
    debugPrint("Iniciando pessoa: ${widget.pessoa.id}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        leading: Text("Id: ${widget.pessoa.id}"),
        title: Text(widget.pessoa.nome),
        subtitle: Text("Peso: ${widget.pessoa.peso.paraPeso()}"),
        trailing: Text("Altura: ${widget.pessoa.altura.paraAltura()} cm"),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint("removendo pessoa: ${widget.pessoa.id}");
    super.dispose();
  }
}
