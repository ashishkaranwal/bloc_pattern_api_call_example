import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class DetailScreen extends StatelessWidget {
  Pokemon pokemonData;
   DetailScreen({
    required this.pokemonData,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [

            Column(
              children: [


                Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${pokemonData.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                      SizedBox(height: 10,),
                      SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Image.network(pokemonData.imageurl!))
                    ],
                  ),
                ),

                SizedBox(height: 200,)




              ],
            ),

            Column(
              children: [

                SizedBox(height: 250,),


                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),)

                    ),

                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 10),
                     child: Column(
                       children: [
                         Text(pokemonData.xdescription??""),

                         SizedBox(height: 20,),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [

                           Container(
                            decoration:  BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.all(Radius.circular(15))

                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: [
                                   Text("Attack",style: TextStyle(fontWeight: FontWeight.bold),),
                                   SizedBox(height: 20,),
                                   Text("${pokemonData.attack}"),
                                 ],
                               ),
                             ),
                           ),

                           Container(
                            decoration:  BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.all(Radius.circular(15))

                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: [
                                   Text("Defence",style: TextStyle(fontWeight: FontWeight.bold),),
                                   SizedBox(height: 20,),
                                   Text("${pokemonData.defense}"),
                                 ],
                               ),
                             ),
                           ),



                         ],)
                       ],
                     ),
                   ),
                  ),
                ),



              ],
            ),




          ],
        ),
      ),
    );
  }
}
