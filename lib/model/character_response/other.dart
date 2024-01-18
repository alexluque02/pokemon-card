import 'dart:convert';

import 'dream_world.dart';
import 'home.dart';
import 'official_artwork.dart';
import 'showdown.dart';

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;
  Showdown? showdown;

  Other({this.dreamWorld, this.home, this.officialArtwork, this.showdown});

  factory Other.fromMap(Map<String, dynamic> data) => Other(
        dreamWorld: data['dream_world'] == null
            ? null
            : DreamWorld.fromMap(data['dream_world'] as Map<String, dynamic>),
        home: data['home'] == null
            ? null
            : Home.fromMap(data['home'] as Map<String, dynamic>),
        officialArtwork: data['official-artwork'] == null
            ? null
            : OfficialArtwork.fromMap(
                data['official-artwork'] as Map<String, dynamic>),
        showdown: data['showdown'] == null
            ? null
            : Showdown.fromMap(data['showdown'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'dream_world': dreamWorld?.toMap(),
        'home': home?.toMap(),
        'official-artwork': officialArtwork?.toMap(),
        'showdown': showdown?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Other].
  factory Other.fromJson(String data) {
    return Other.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Other] to a JSON string.
  String toJson() => json.encode(toMap());
}
