import 'package:estudo2/Widgets/pessoa/lista_pessoas.dart';
import 'package:estudo2/controllers/pessoa_controller.dart';
import 'package:estudo2/controllers/theme_controller.dart';
import 'package:estudo2/models/criar_pessoa_dto.dart';
import 'package:estudo2/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pessoaController = GetIt.instance<PessoaController>();
  final ThemeController themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {
    themeController.mensagemNotifier.addListener(_onThemeMensagem);
    pessoaController.mensagemNotifier.addListener(_onPessoaMensagem);
    super.initState();
  }

  void _onThemeMensagem() {
    print(themeController.mensagemNotifier.value);
    ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(themeController.mensagemNotifier.value),
      ),
    );
  }

  void _onPessoaMensagem() {
    print(pessoaController.mensagemNotifier.value);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(pessoaController.mensagemNotifier.value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: themeController.darkTheme,
              onChanged: (value) {
                themeController.toggleTheme(value);
              },
            ),
            Text("Tema escuro"),
          ],
        ),
      ),
      appBar: AppBar(title: Text("Meu Primeiro App.")),
      body: ListenableBuilder(
        listenable: pessoaController,
        builder: (context, child) {
          return ListaPessoa(pessoas: pessoaController.pessoas);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(
            context,
          ).pushNamed(Routes.criarPEssoaPage);

          if (result != null) {
            final pessoaDto = result as CriarPessoaDto;
            pessoaController.adicionarPessoa(pessoaDto);
          }
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  @override
  void dispose() {
    pessoaController.mensagemNotifier.removeListener(_onPessoaMensagem);
    themeController.mensagemNotifier.removeListener(_onThemeMensagem);
    super.dispose();
  }
}
