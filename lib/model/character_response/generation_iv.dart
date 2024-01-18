import 'dart:convert';

import 'diamond_pearl.dart';
import 'heartgold_soulsilver.dart';
import 'platinum.dart';

class GenerationIv {
  DiamondPearl? diamondPearl;
  HeartgoldSoulsilver? heartgoldSoulsilver;
  Platinum? platinum;

  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  factory GenerationIv.fromMap(Map<String, dynamic> data) => GenerationIv(
        diamondPearl: data['diamond-pearl'] == null
            ? null
            : DiamondPearl.fromMap(
                data['diamond-pearl'] as Map<String, dynamic>),
        heartgoldSoulsilver: data['heartgold-soulsilver'] == null
            ? null
            : HeartgoldSoulsilver.fromMap(
                data['heartgold-soulsilver'] as Map<String, dynamic>),
        platinum: data['platinum'] == null
            ? null
            : Platinum.fromMap(data['platinum'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'diamond-pearl': diamondPearl?.toMap(),
        'heartgold-soulsilver': heartgoldSoulsilver?.toMap(),
        'platinum': platinum?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationIv].
  factory GenerationIv.fromJson(String data) {
    return GenerationIv.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationIv] to a JSON string.
  String toJson() => json.encode(toMap());
}
