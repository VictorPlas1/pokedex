import 'App.dart';
import 'Combate.dart';
import 'Pokemon.dart';

main() {
  //App.inicioApp();
  App.inicioApp();
  Pokemon pokemon1 = new Pokemon();
  Pokemon pokemon2 = new Pokemon();
  Combate.attack(pokemon1, pokemon2);
}
