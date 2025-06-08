class ProductByTimeModel {
  final int? id;
  final int? productId;
  final int? clubId;
  final String? name;
  final int? productType;
  final String? fromDate;
  final String? toDate;
  final String? fromTime;
  final String? toTime;
  final String? sessionDuration;
  final int? sessionCapacity;
  final int? duration;
  final bool? saturday;
  final bool? sunday;
  final bool? monday;
  final bool? tuesday;
  final bool? wednesday;
  final bool? thursday;
  final bool? friday;
  final double? price;
  final double? basePrice;
  final double? discountAmount;
  final double? discountPercentage;
  final double? couponAmount;
  final double? couponPercentage;
  final String? description;
  final List<ProductOffer>? productOffers;

  ProductByTimeModel({
    this.id,
    this.productId,
    this.clubId,
    this.name,
    this.productType,
    this.fromDate,
    this.toDate,
    this.fromTime,
    this.toTime,
    this.sessionDuration,
    this.sessionCapacity,
    this.duration,
    this.saturday,
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.price,
    this.basePrice,
    this.discountAmount,
    this.discountPercentage,
    this.couponAmount,
    this.couponPercentage,
    this.description,
    this.productOffers,
  });

  factory ProductByTimeModel.fromJson(Map<String, dynamic> json) {
    return ProductByTimeModel(
      id: json['id'],
      productId: json['productId'],
      clubId: json['clubId'],
      name: json['name'],
      productType: json['productType'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      fromTime: json['fromTime'],
      toTime: json['toTime'],
      sessionDuration: json['sessionDuration'],
      sessionCapacity: json['sessionCapacity'],
      duration: json['duration'],
      saturday: json['saturday'],
      sunday: json['sunday'],
      monday: json['monday'],
      tuesday: json['tuesday'],
      wednesday: json['wednesday'],
      thursday: json['thursday'],
      friday: json['friday'],
      price: (json['price'] as num?)?.toDouble(),
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      couponAmount: (json['couponAmount'] as num?)?.toDouble(),
      couponPercentage: (json['couponPercentage'] as num?)?.toDouble(),
      description: json['description'],
      productOffers: (json['productOffers'] as List?)
          ?.map((offer) => ProductOffer.fromJson(offer))
          .toList(),
    );
  }
}

class ProductOffer {
  final String? fromDate;
  final String? toDate;
  final String? fromTime;
  final String? toTime;
  final double? discount;
  final bool? isForPlayer;
  final bool? isForCoach;
  final bool? saturday;
  final bool? sunday;
  final bool? monday;
  final bool? tuesday;
  final bool? wednesday;
  final bool? thursday;
  final bool? friday;
  final String? offerCode;
  final String? description;
  final int? id;
  final int? productId;

  ProductOffer({
    this.fromDate,
    this.toDate,
    this.fromTime,
    this.toTime,
    this.discount,
    this.isForPlayer,
    this.isForCoach,
    this.saturday,
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.offerCode,
    this.description,
    this.id,
    this.productId,
  });

  factory ProductOffer.fromJson(Map<String, dynamic> json) {
    return ProductOffer(
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      fromTime: json['fromTime'],
      toTime: json['toTime'],
      discount: (json['discount'] as num?)?.toDouble(),
      isForPlayer: json['isForPlayer'],
      isForCoach: json['isForCoach'],
      saturday: json['saturday'],
      sunday: json['sunday'],
      monday: json['monday'],
      tuesday: json['tuesday'],
      wednesday: json['wednesday'],
      thursday: json['thursday'],
      friday: json['friday'],
      offerCode: json['offerCode'],
      description: json['description'],
      id: json['id'],
      productId: json['productId'],
    );
  }
}
