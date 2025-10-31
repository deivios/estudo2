import 'package:estudo2/controllers/pessoa_controller.dart';
import 'package:estudo2/models/criar_pessoa_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class CriarPessoaPAge extends StatefulWidget {
  const CriarPessoaPAge({super.key});

  @override
  State<CriarPessoaPAge> createState() => _CriarPessoaPAgeState();
}

class _CriarPessoaPAgeState extends State<CriarPessoaPAge> {
  final gap = SizedBox(height: 16);
  final nomeController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final pessoaController = GetIt.instance<PessoaController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nova página")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha o nome";
                  }
                  final nomeCompleto = value!.split(" ");

                  if (nomeCompleto.length < 2) {
                    return "Por favor, preencha o sobrenome";
                  }
                  return null;
                },
                controller: nomeController,
                decoration: InputDecoration(
                  label: Text("Nome completo"),
                  border: OutlineInputBorder(),
                ),
              ),
              gap,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+[,]?\d{0,1}'))],
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha o peso.";
                  }
                  return null;
                },
                controller: pesoController,
                decoration: InputDecoration(
                  label: Text("peso"),
                  border: OutlineInputBorder(),
                  suffixText: "Kg(ex: 72,5)",
                ),
              ),
              gap,
              TextFormField(
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Por favor, preencha a altura.";
                  }
                  return null;
                },
                controller: alturaController,
                decoration: InputDecoration(
                  label: Text("Altura"),
                  border: OutlineInputBorder(),
                  suffixText: "Cm (Ex: 180)",
                ),
              ),
              gap,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState?.validate() == true) {
                          final criarPessoa = CriarPessoaDto(
                            nome: nomeController.text,
                            altura: int.parse(alturaController.text),
                            peso: double.parse(pesoController.text.replaceAll(",", ".")),
                          );
                          pessoaController.adicionarPessoa(criarPessoa);
                          
                          Navigator.of(context).pop();
                        }
                        debugPrint("Valor do nome: ${nomeController.text}");
                        debugPrint("Valor da altura:${alturaController.text}");
                        debugPrint("Valor do peso:${pesoController.text}");
                      },
                      child: Text("Salvar"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }
}
