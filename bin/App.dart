import 'dart:io';
import 'Pokemon.dart';
import 'Habilidad.dart';
import 'Combate.dart';

class App {
  static inicioApp() async {
    var opcion;
    String respuesta;
    stdout.writeln('''Elige la opcion que desea realizar
1 - Listar caracteristicas de un Pokemon
2 - Pelea Pokemon''');
    respuesta = stdin.readLineSync() ?? 'e';
    opcion = int.tryParse(respuesta);
    switch (opcion) {
      case 1:
        String respuesta = _pedirNombre();
        Pokemon pokemon = await Pokemon().obtenerPokemon(respuesta);
        imprime(pokemon);

        break;
      case 2:
        combate();
      default:
    }
  }

  static imprime(Pokemon pokemon) async {
    stdout.writeln("Nombre: ${pokemon.nombre}");
    stdout.writeln("Estadisticas:");
    stdout.writeln("Vida: ${pokemon.vida}");
    stdout.writeln("Ataque: ${pokemon.ataque}");
    stdout.writeln("Defensa: ${pokemon.defensa}");
    stdout.writeln("Ataque Especial: ${pokemon.ataqueEspecial}");
    stdout.writeln("Defensa especial: ${pokemon.defensaEspecial}");
    stdout.writeln("Velocidad ${pokemon.velocidad}");
    stdout.writeln("Tipos:");
    for (var elemento in pokemon.tipos) {
      stdout.writeln("$elemento");
    }
    stdout.writeln("Habilidades:");
    for (Habilidad elemento in pokemon.habilidades) {
      stdout.writeln("${elemento.nombre?.toUpperCase()}");
      stdout.writeln("Pokemons con la misma habilidad:");
      for (String pokemon in elemento.pokemons) {
        stdout.writeln("$pokemon");
      }
    }
  }

  static String _pedirNombre() {
    stdout.writeln("Escribe el nombre del Pokemon a consultar");
    return stdin.readLineSync() ?? "error";
  }
/*
  static eligeDos() async {
    Uri url =
        Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=1&limit=1302');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      Map pokemonazar = json.decode(respuesta.body);

      if (pokemonazar.length <= 1302) {
        var pokemon1 = Random().nextInt(1302);
        var primerPokemon = pokemon1.toString();

        var pokemon2;

        do {
          pokemon2 = Random().nextInt(1302);
        } while (pokemon2 == pokemon1);
        var segundoPokemon = pokemon2.toString();

        print('Pokemon 1: $primerPokemon: ${Pokemon().nombre}');
        print('Pokemon 2: $segundoPokemon: ${Pokemon().nombre}');
      }
    }
  }*/
}


// Al atacar restamos la defensa del otro a nuestro ataque y el resultado es la vida que pierde 
//el que pierde toda la vida pierde el combate 
//Si eliges defender incrementas tu defensa un 30 %
// Turnos alternativos