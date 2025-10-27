import 'package:estudo2/Widgets/lista_pessoas.dart';
import 'package:estudo2/models/criar_pessoa_dto.dart';
import 'package:estudo2/models/pessoa.dart';
import 'package:estudo2/routes/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pessoa> pessoas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu Primeiro App.")),
      body: ListaPessoa(
        pessoas: pessoas,
        onDeletePessoa: (pessoa) {
          pessoas.remove(pessoa);
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed(Routes.criarPEssoaPage);

          if (result != null) {
            final pessoaDto = result as CriarPessoaDto;
            final pessoa = Pessoa(
              id: pessoas.length + 1,
              nome: pessoaDto.nome,
              altura: pessoaDto.altura,
              peso: pessoaDto.peso,
            );
            setState(() {
              pessoas.add(pessoa);
            });
          }

          debugPrint("resultado: $result");
          // context.pushNamed(Routes.criarPEssoaPage);

          // Navigator.of(context).pushAndRemoveUntil(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return NovaPagina();
          //     },
          //   ),
          //   (route) => false,
          // );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
