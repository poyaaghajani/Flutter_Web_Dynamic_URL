class ProductAvailableTimeModel {
  final String? fromTime;
  final String? toTime;

  ProductAvailableTimeModel({
    required this.fromTime,
    required this.toTime,
  });

  factory ProductAvailableTimeModel.fromJson(Map<String, dynamic> json) {
    return ProductAvailableTimeModel(
      fromTime: json['fromTime'],
      toTime: json['toTime'],
    );
  }
}
