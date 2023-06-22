class FilmEntity {
  final int id;
  final String name;
  final String description;

  FilmEntity({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description;

  @override
  String toString() {
    return 'FilmEntity { id: $id, name: $name, description: $description }';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;

    return map;
  }

  static FilmEntity fromJson(Map<String, dynamic> json) {
    return FilmEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  FilmEntity copyWith({id, name, description}) {
    return FilmEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
