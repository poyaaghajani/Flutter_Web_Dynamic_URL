class ClubCategoriesModel {
  final List<ClubCategoryModel>? data;
  final int? totalCount;
  final int? pageSize;
  final int? pageNo;

  ClubCategoriesModel({
    required this.data,
    required this.totalCount,
    required this.pageSize,
    required this.pageNo,
  });

  factory ClubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return ClubCategoriesModel(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((e) => ClubCategoryModel.fromJson(e))
              .toList()
          : null,
      totalCount: json['totalCount'] as int?,
      pageSize: json['pageSize'] as int?,
      pageNo: json['pageNo'] as int?,
    );
  }
}

class ClubCategoryModel {
  final int? id;
  final String? title;
  final int? orderId;
  final String? logoUrl;
  final String? description;
  final String? seoName;
  final String? label1;
  final String? label2;
  final String? label3;
  final String? label4;
  final String? label5;
  final String? label6;
  final String? label7;
  final String? label8;
  final String? modifiedAt;
  final int? businessModelType;
  final String? seoDescription;
  final String? seoKeywords;

  ClubCategoryModel({
    required this.id,
    required this.title,
    required this.orderId,
    required this.logoUrl,
    required this.description,
    required this.seoName,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.label5,
    required this.label6,
    required this.label7,
    required this.label8,
    required this.modifiedAt,
    required this.businessModelType,
    required this.seoDescription,
    required this.seoKeywords,
  });

  factory ClubCategoryModel.fromJson(Map<String, dynamic> json) {
    return ClubCategoryModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      orderId: json['orderId'] as int?,
      logoUrl: json['logoUrl'] as String?,
      description: json['description'] as String?,
      seoName: json['seoName'] as String?,
      label1: json['label1'] as String?,
      label2: json['label2'] as String?,
      label3: json['label3'] as String?,
      label4: json['label4'] as String?,
      label5: json['label5'] as String?,
      label6: json['label6'] as String?,
      label7: json['label7'] as String?,
      label8: json['label8'] as String?,
      modifiedAt: json['modifiedAt'] as String?,
      businessModelType: json['businessModelType'] as int?,
      seoDescription: json['seoDescription'] as String?,
      seoKeywords: json['seoKeywords'] as String?,
    );
  }
}
