import 'dart:convert';

import 'result.dart';

class CharacterListResponse {
  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  CharacterListResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory CharacterListResponse.fromMap(Map<String, dynamic> data) {
    return CharacterListResponse(
      count: data['count'] as int?,
      next: data['next'] as String?,
      previous: data['previous'] as dynamic,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterListResponse].
  factory CharacterListResponse.fromJson(String data) {
    return CharacterListResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterListResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
