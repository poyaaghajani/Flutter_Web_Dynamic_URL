class AllProductsModel {
  final int? id;
  final int? clubId;
  final String? name;
  final int? productType;
  final int? sessionCapacity;
  final String? sessionDuration;
  final double? price;
  final double? basePrice;
  final double? discountAmount;
  final double? discountPercentage;
  final double? couponAmount;
  final double? couponPercentage;
  final String? description;
  // final List<ProductPrices>? productPrices;
  // final List<ProductOffers>? productOffers;

  AllProductsModel({
    required this.id,
    required this.clubId,
    required this.name,
    required this.productType,
    required this.sessionCapacity,
    required this.sessionDuration,
    required this.price,
    required this.basePrice,
    required this.discountAmount,
    required this.discountPercentage,
    required this.couponAmount,
    required this.couponPercentage,
    required this.description,
  });

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    return AllProductsModel(
      id: json['id'],
      clubId: json['clubId'],
      name: json['name'],
      productType: json['productType'],
      sessionCapacity: json['sessionCapacity'],
      sessionDuration: json['sessionDuration'],
      price: json['price'],
      basePrice: json['basePrice'],
      discountAmount: json['discountAmount'],
      discountPercentage: json['discountPercentage'],
      couponAmount: json['couponAmount'],
      couponPercentage: json['couponPercentage'],
      description: json['description'],
    );
  }
}
