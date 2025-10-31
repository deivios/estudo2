import 'package:estudo2/models/criar_pessoa_dto.dart';
import 'package:estudo2/models/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaController extends ChangeNotifier{
  final List<Pessoa> _pessoas = [];
  List<Pessoa> get pessoas => _pessoas;

  ValueNotifier<String> mensagemNotifier = ValueNotifier("");

  void adicionarPessoa(CriarPessoaDto criarPessoa) {
    final pessoa = Pessoa(
      id: _pessoas.length + 1,
      nome: criarPessoa.nome,
      altura: criarPessoa.altura,
      peso: criarPessoa.peso,
    );

    _pessoas.add(pessoa);
    mensagemNotifier.value = "Pessoa adicionada com sucesso.";
    notifyListeners();
  }

  void removerPessoa(Pessoa pessoa) {
    _pessoas.remove(pessoa);
    mensagemNotifier.value = "Pessoa removida com sucesso.";

    notifyListeners();
  }
}
