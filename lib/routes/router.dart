import 'package:estudo2/pages/home_page.dart';
import 'package:estudo2/pages/criar_pessoa_page.dart';
import 'package:estudo2/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  Routes.initialRoute: (BuildContext context) => HomePage(),
  Routes.criarPEssoaPage: (BuildContext context) => CriarPessoaPAge(),
};