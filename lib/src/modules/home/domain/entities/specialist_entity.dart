class SpecialistEntity {
  final String name;
  final String imageUrl;
  final String color;
  final int total;

  SpecialistEntity({
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.total,
  });

  factory SpecialistEntity.fromJson(Map<String, dynamic> json) {
    return SpecialistEntity(
      name: json['name'],
      imageUrl: json['image_url'],
      color: json['color'],
      total: json['total'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpecialistEntity &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.color == color &&
        other.total == total;
  }

  @override
  int get hashCode {
    return name.hashCode ^ imageUrl.hashCode ^ color.hashCode ^ total.hashCode;
  }
}
