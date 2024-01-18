import 'dart:convert';

class Species {
  String? name;
  String? url;

  Species({this.name, this.url});

  factory Species.fromMap(Map<String, dynamic> data) => Species(
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Species].
  factory Species.fromJson(String data) {
    return Species.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Species] to a JSON string.
  String toJson() => json.encode(toMap());
}
