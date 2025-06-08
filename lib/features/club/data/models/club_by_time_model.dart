class PublicClubByTimeModel {
  final int? id;
  final String? name;

  PublicClubByTimeModel({
    required this.id,
    required this.name,
  });

  factory PublicClubByTimeModel.fromJson(Map<String, dynamic> json) {
    return PublicClubByTimeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
