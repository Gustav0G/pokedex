class PokemonModel {
  String name;
  String url;

  PokemonModel({required this.name, required this.url});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }
}
