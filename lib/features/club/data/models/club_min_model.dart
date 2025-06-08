class PublicClubMinModel {
  final int? id;
  final String? name;

  PublicClubMinModel({
    required this.id,
    required this.name,
  });

  factory PublicClubMinModel.fromJson(Map<String, dynamic> json) {
    return PublicClubMinModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
