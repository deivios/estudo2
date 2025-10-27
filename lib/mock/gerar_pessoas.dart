import 'dart:math';
import 'package:estudo2/models/pessoa.dart';
import 'package:faker/faker.dart';

List<Pessoa> gerarPessoas(int quantidade) {
  final faker = Faker();
  final random = Random();

  return List<Pessoa>.generate(
    quantidade,
    (index) => Pessoa(
      id: index + 1,
      nome: faker.person.name(),
      altura: 140 + random.nextInt(60),    // 140..199 cm
      peso: 50 + random.nextDouble() * 50, // 50.0..99.9 kg
    ),
  );
}
