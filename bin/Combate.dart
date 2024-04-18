import 'Pokemon.dart';
import 'dart:io';
import 'dart:math';
import 'App.dart';

class Combate {
  Pokemon? pokemon1;
  Pokemon? pokemon2;

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

  static attack(Pokemon pokemon1, Pokemon pokemon2) {
    // stdout.writeln("${pokemon1.velocidad}${pokemon2.velocidad}");
    /*if (pokemon1.velocidad! > pokemon2.velocidad!) {
      stdout.writeln("Primero ataca $pokemon1");
    } else if (pokemon1.velocidad! < pokemon2.velocidad!) {
      stdout.writeln("El primero en atacar es $pokemon2");
    } else {}
  }*/
  }
}
