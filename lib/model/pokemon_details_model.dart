class PokemonDetailsModel {
  int? id;
  List<Abilities>? abilities;
  String? name;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  int? height;
  int? weight;

  PokemonDetailsModel(
      {this.id,
      this.abilities,
      this.name,
      this.sprites,
      this.stats,
      this.height,
      this.types,
      this.weight});

  factory PokemonDetailsModel.fromJson(Map json) {
    return PokemonDetailsModel(
      id: json['id'],
      abilities: json['abilities'] != null
          ? List<Abilities>.from(
              json['abilities'].map((e) => Abilities.fromJson(e)))
          : <Abilities>[],
      name: json['name'],
      sprites: Sprites.fromJson(json['sprites']),
      stats: json['stats'] != null
          ? List<Stats>.from(json['stats'].map((e) => Stats.fromJson(e)))
          : <Stats>[],
      height: json['height'],
      weight: json['weight'],
      types: json['types'] != null
          ? List<Types>.from(json['types'].map((e) => Types.fromJson(e)))
          : <Types>[],
    );
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(name: json['name'], url: json['url']);
  }
}

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return Abilities(
        ability: Ability.fromJson(json['ability']),
        isHidden: json['isHidden'],
        slot: json['slot']);
  }
}

class Stat {
  String? name;
  String? url;

  Stat({this.name, this.url});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(name: json['name'], url: json['url']);
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Stat? stat;

  Stats({this.baseStat, this.effort, this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
        baseStat: json['base_stat'],
        effort: json['effort'],
        stat: Stat.fromJson(json['stat']));
    //!= null ? Ability.fromJson(json['stat']) : null
  }
}

class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(
        slot: json['slot'],
        type: json['type'] != null ? Ability.fromJson(json['type']) : null);
  }
}

class Sprites {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  Sprites(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['frontShiny_female'],
    );
  }
}
