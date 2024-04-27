import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/pokemon_bloc.dart';
import 'package:pokedex/screens/detail_screen.dart';
import 'package:pokedex/services/api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokemon App"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(child: Column(
            children: [
              PokemonListScreen(),
              Footer()
            ],
          )),
        ),
      ),
    );
  }
}

class PokemonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeBlocStatus>(
      builder: (context, status) {
        if (status == HomeBlocStatus.loading) {
          return CircularProgressIndicator();
        } else if (status == HomeBlocStatus.error) {
          return Text('Error loading pokedexs');
        } else {
          return GridView.builder(
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4),
              ),
              itemCount: context.select((HomeBloc bloc) => bloc.pokemonsToDisplay.length),
              itemBuilder: (context, index) {
                  return Builder(builder: (context){

                    final pokemon = context.select((HomeBloc bloc) => bloc.pokemonsToDisplay[index]);

                    return ListTile(
                      title: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(pokemonData: pokemon)));
                        },
                        child: Card(
                          child: Column(
                            children: [

                              SizedBox(
                                height: 50,
                                  width: 50,
                                  child: Image.network(pokemon.imageurl!,fit: BoxFit.contain,)),

                              SizedBox(height: 10,),
                              Text(pokemon.name??"",style: TextStyle(color: Colors.black),)
                            ],
                          ),
                        ),
                      ),
                    );

                  });
              });
        }
      },
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeBlocStatus>(
      builder: (context, status) {

        final currentPage = context.select((HomeBloc bloc) => bloc.currentPage);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("page ${currentPage}"),
            ],
          ),
        );
      },
    );
  }
}

