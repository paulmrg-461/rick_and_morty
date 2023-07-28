// To parse this JSON data, do
//
//     final locationEntity = locationEntityFromJson(jsonString);

import 'dart:convert';

class LocationEntity {
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String? url;
  final DateTime? created;

  LocationEntity({
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  LocationEntity copyWith({
    int? id,
    String? name,
    String? type,
    String? dimension,
    List<String>? residents,
    String? url,
    DateTime? created,
  }) =>
      LocationEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        dimension: dimension ?? this.dimension,
        residents: residents ?? this.residents,
        url: url ?? this.url,
        created: created ?? this.created,
      );

  factory LocationEntity.fromRawJson(String str) =>
      LocationEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationEntity.fromJson(Map<String, dynamic> json) => LocationEntity(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: json["residents"] == null
            ? []
            : List<String>.from(json["residents"]!.map((x) => x)),
        url: json["url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": residents == null
            ? []
            : List<dynamic>.from(residents!.map((x) => x)),
        "url": url,
        "created": created?.toIso8601String(),
      };
}
