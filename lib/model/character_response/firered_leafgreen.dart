import 'dart:convert';

class FireredLeafgreen {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  FireredLeafgreen({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory FireredLeafgreen.fromMap(Map<String, dynamic> data) {
    return FireredLeafgreen(
      backDefault: data['back_default'] as String?,
      backShiny: data['back_shiny'] as String?,
      frontDefault: data['front_default'] as String?,
      frontShiny: data['front_shiny'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FireredLeafgreen].
  factory FireredLeafgreen.fromJson(String data) {
    return FireredLeafgreen.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FireredLeafgreen] to a JSON string.
  String toJson() => json.encode(toMap());
}
