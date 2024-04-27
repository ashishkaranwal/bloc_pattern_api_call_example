import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_model.dart';

class ApiService{

  static Future<List<Pokemon>?> fetchData() async{
    Uri url =Uri.parse("https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json");
    http.Response response = await http.get(url);
    //debugPrint(response.body);
   List<Pokemon>? result=pokemonFromJson(response.body);
    return result;
  }





}