class ProductGenderModel {
  final List<int>? data;

  ProductGenderModel({required this.data});

  factory ProductGenderModel.fromJson(Map<String, dynamic> json) {
    return ProductGenderModel(
      data: json['data'].cast<int>(),
    );
  }
}
