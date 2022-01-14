class HeartSpecialistEntity {
  final String name;
  final String description;
  final double distance;
  final Actions actions;

  HeartSpecialistEntity({
    required this.name,
    required this.description,
    required this.distance,
    required this.actions,
  });

  factory HeartSpecialistEntity.fromJson(Map<String, dynamic> json) {
    return HeartSpecialistEntity(
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      distance: json['distance'] ?? 0.0,
      actions: Actions.fromJson(json['actions']),
    );
  }
}

class Actions {
  final String chat;
  final String call;

  Actions(this.chat, this.call);

  factory Actions.fromJson(Map<String, dynamic> json) {
    return Actions(
      json['chat'] ?? "",
      json['call'] ?? "",
    );
  }
}
