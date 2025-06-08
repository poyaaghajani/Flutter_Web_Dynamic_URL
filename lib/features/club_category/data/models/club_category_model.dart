import 'dart:convert';

class ClubCategoryCacheModel {
  final int id;
  final String seoName;
  final int businessModelType;

  ClubCategoryCacheModel({
    required this.id,
    required this.seoName,
    required this.businessModelType,
  });

  factory ClubCategoryCacheModel.fromJson(Map<String, dynamic> json) {
    return ClubCategoryCacheModel(
      id: json['id'] as int,
      seoName: json['seoName'] as String,
      businessModelType: json['businessModelType'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'seoName': seoName,
      'businessModelType': businessModelType,
    };
  }

  static List<ClubCategoryCacheModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList
        .map((json) => ClubCategoryCacheModel.fromJson(json))
        .toList();
  }

  static String toJsonList(List<ClubCategoryCacheModel> categories) {
    return jsonEncode(categories.map((cat) => cat.toJson()).toList());
  }
}
