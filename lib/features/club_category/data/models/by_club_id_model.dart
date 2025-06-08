class ClubCategoryByClubIdModel {
  final int? id;
  final String? title;
  final String? logoUrl;

  ClubCategoryByClubIdModel({
    required this.id,
    required this.title,
    required this.logoUrl,
  });

  factory ClubCategoryByClubIdModel.fromJson(Map<String, dynamic> json) {
    return ClubCategoryByClubIdModel(
      id: json['id'],
      title: json['title'],
      logoUrl: json['logoUrl'],
    );
  }
}
