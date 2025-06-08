class ClubCategoryByParentIdModel {
  final int? id;
  final String? title;
  final String? logoUrl;

  ClubCategoryByParentIdModel({
    required this.id,
    required this.title,
    required this.logoUrl,
  });

  factory ClubCategoryByParentIdModel.fromJson(Map<String, dynamic> json) {
    return ClubCategoryByParentIdModel(
      id: json['id'],
      title: json['title'],
      logoUrl: json['logoUrl'],
    );
  }
}
