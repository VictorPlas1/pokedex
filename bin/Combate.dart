import 'Pokemon.dart';
import 'dart:io';
import 'dart:math';
import 'App.dart';

class Combate {
  Pokemon? pokemon1;
  Pokemon? pokemon2;
}

combate() async {
  stdout.writeln('********** COMBATE POKEMON **********');
  stdout.writeln('El pokemon 1 es:');
  int random = Random().nextInt(1025);
  Pokemon pokemon1 = await Pokemon().obtenerPokemon(random.toString());
  App.imprime(pokemon1);
  stdout.writeln('El pokemon 2 es:');
  random = Random().nextInt(1025);
  Pokemon pokemon2 = await Pokemon().obtenerPokemon(random.toString());
  App.imprime(pokemon2);
}
