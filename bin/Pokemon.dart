import 'App.dart';
import 'Habilidad.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Pokemon {
  String? nombre;
  List<String> tipos = [];
  List<Habilidad> habilidades = [];
  int? vida;
  int? ataque;
  int? defensa;
  int? ataqueEspecial;
  int? defensaEspecial;
  int? velocidad;
  Pokemon();
  Pokemon.fromApi(datos, listaHabilidades) {
    nombre = datos['name'];
    for (var elemento in listaHabilidades) {
      habilidades.add(elemento);
    }
    for (var elemento in datos['stats']) {
      switch (elemento['stat']['name']) {
        case 'hp':
          vida = elemento['base_stat'];
          break;
        case 'attack':
          ataque = elemento['base_stat'];
          break;
        case 'defense':
          defensa = elemento['base_stat'];
          break;
        case 'special-attack':
          ataqueEspecial = elemento['base_stat'];
          break;
        case 'special-defense':
          defensaEspecial = elemento['base_stat'];
          break;
        case 'speed':
          velocidad = elemento['base_stat'];
          break;
      }
    }
  }

  listaDeHabilidades(datos) async {
    List<Habilidad> lista = [];
    for (var elemento in datos['abilities']) {
      lista
          .add(await Habilidad().obtenerHabilidad(elemento['ability']['name']));
    }
    return lista;
  }

  obtenerPokemon(String nombre) async {
    Uri url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$nombre");
    var respuesta = await http.get(url);
    try {
      if (respuesta.statusCode == 200) {
        List lista = await listaDeHabilidades(json.decode(respuesta.body));
        Pokemon pokemon = Pokemon.fromApi(json.decode(respuesta.body), lista);
        return pokemon;
      } else if (respuesta.statusCode == 404) {
        throw ("El pokemon que buscas no existe");
      } else
        throw (" Ha habido un problema en la conexion");
    } catch (e) {
      stdout.writeln(e);
      App.inicioApp();
    }
  }
}
