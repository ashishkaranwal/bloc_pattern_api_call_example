import 'package:bloc/bloc.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/api_service.dart';

enum HomeBlocStatus { loading, loaded, error }


abstract class HomeBlocEvent{

}

class loadingEvent extends HomeBlocEvent{

}

class HomeBloc extends Bloc<HomeBlocEvent,HomeBlocStatus> {
   List<Pokemon> pokemons=[];
   List<Pokemon> pokemonsToDisplay=[];

  int currentPage=1;
  int itemPerPage=12;

  HomeBloc() : super(HomeBlocStatus.loading) {
    fetchData();
  }



  void fetchData() async{
    List<Pokemon>? result=await ApiService.fetchData();
    if(result!=null){
      pokemons.addAll(result);
     for (var element in pokemons) {
       if(pokemonsToDisplay.length<12){
         pokemonsToDisplay.add(element);
       }else{
         break;
       }
     }
      emit(HomeBlocStatus.loaded);
    }
  }


  void loadMore() async{
    int lastIndex=pokemonsToDisplay.length-1;

    for(int i=lastIndex+1;i<lastIndex+12;i++){
      pokemonsToDisplay.add(pokemons[i]);
    }

    currentPage++;

  }

}
