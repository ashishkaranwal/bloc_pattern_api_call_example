import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) => List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
  String? name;
  String? id;
  String? imageurl;
  String? xdescription;
  String? ydescription;
  String? height;
  String? category;
  String? weight;
  List<String>? typeofpokemon;
  List<String>? weaknesses;
  List<String>? evolutions;
  List<String>? abilities;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  int? total;
  String? malePercentage;
  String? femalePercentage;
  int? genderless;
  String? cycles;
  String? eggGroups;
  String? evolvedfrom;
  String? reason;
  String? baseExp;

  Pokemon({
    this.name,
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.category,
    this.weight,
    this.typeofpokemon,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.malePercentage,
    this.femalePercentage,
    this.genderless,
    this.cycles,
    this.eggGroups,
    this.evolvedfrom,
    this.reason,
    this.baseExp,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    name: json["name"],
    id: json["id"],
    imageurl: json["imageurl"],
    xdescription: json["xdescription"],
    ydescription: json["ydescription"],
    height: json["height"],
    category: json["category"],
    weight: json["weight"],
    typeofpokemon: json["typeofpokemon"] == null ? [] : List<String>.from(json["typeofpokemon"]!.map((x) => x)),
    weaknesses: json["weaknesses"] == null ? [] : List<String>.from(json["weaknesses"]!.map((x) => x)),
    evolutions: json["evolutions"] == null ? [] : List<String>.from(json["evolutions"]!.map((x) => x)),
    abilities: json["abilities"] == null ? [] : List<String>.from(json["abilities"]!.map((x) => x)),
    hp: json["hp"],
    attack: json["attack"],
    defense: json["defense"],
    specialAttack: json["special_attack"],
    specialDefense: json["special_defense"],
    speed: json["speed"],
    total: json["total"],
    malePercentage: json["male_percentage"],
    femalePercentage: json["female_percentage"],
    genderless: json["genderless"],
    cycles: json["cycles"],
    eggGroups: json["egg_groups"],
    evolvedfrom: json["evolvedfrom"],
    reason: json["reason"],
    baseExp: json["base_exp"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "imageurl": imageurl,
    "xdescription": xdescription,
    "ydescription": ydescription,
    "height": height,
    "category": category,
    "weight": weight,
    "typeofpokemon": typeofpokemon == null ? [] : List<dynamic>.from(typeofpokemon!.map((x) => x)),
    "weaknesses": weaknesses == null ? [] : List<dynamic>.from(weaknesses!.map((x) => x)),
    "evolutions": evolutions == null ? [] : List<dynamic>.from(evolutions!.map((x) => x)),
    "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x)),
    "hp": hp,
    "attack": attack,
    "defense": defense,
    "special_attack": specialAttack,
    "special_defense": specialDefense,
    "speed": speed,
    "total": total,
    "male_percentage": malePercentage,
    "female_percentage": femalePercentage,
    "genderless": genderless,
    "cycles": cycles,
    "egg_groups": eggGroups,
    "evolvedfrom": evolvedfrom,
    "reason": reason,
    "base_exp": baseExp,
  };
}
