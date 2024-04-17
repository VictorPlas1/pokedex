import 'dart:convert';
import 'package:http/http.dart' as http;

class Habilidad {
  String? nombre;
  List<String> pokemons = [];
//Constructores
  Habilidad();
  Habilidad.fromApi(datos) {
    nombre = datos['name'];
    for (var elemento in datos['pokemon']) {
      pokemons.add(elemento['pokemon']['name']);
    }
  }
  //Metodos
  obtenerHabilidad(String nombre) async {
    Uri url2 = Uri.parse("https://pokeapi.co/api/v2/ability/$nombre");
    var respuesta = await http.get(url2);
    if (respuesta.statusCode == 200) {
      Habilidad habilidad = Habilidad.fromApi(jsonDecode(respuesta.body));
      return habilidad;
    } else
      return;
  }
}
