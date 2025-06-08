class CoachPreInvoiceModel {
  final int? playerId;
  final int? productId;
  final int? coachId;
  final String? date;
  final String? fromTime;
  final String? toTime;
  final bool? isValid;
  final int? status;
  final double? coachPrice;
  final double? clubCost;
  final double? serviceCost;
  final double? totalPrice;
  final String? coachName;
  final int? couponPercentage;
  final double? couponAmount;
  final double? discountAmount;
  final int? discountPercentage;
  final int? coachLevel;
  final num? vatAmount;
  final int? gender;
  final int? rank;
  final int? age;
  final String? profileImageUrl;
  final String? description;

  CoachPreInvoiceModel({
    required this.playerId,
    required this.productId,
    required this.coachId,
    required this.date,
    required this.fromTime,
    required this.toTime,
    required this.isValid,
    required this.status,
    required this.coachPrice,
    required this.clubCost,
    required this.serviceCost,
    required this.totalPrice,
    required this.coachName,
    required this.couponPercentage,
    required this.couponAmount,
    required this.discountAmount,
    required this.discountPercentage,
    required this.coachLevel,
    required this.vatAmount,
    required this.gender,
    required this.rank,
    required this.age,
    required this.profileImageUrl,
    required this.description,
  });

  factory CoachPreInvoiceModel.fromJson(Map<String, dynamic> json) {
    return CoachPreInvoiceModel(
      playerId: json['playerId'] as int?,
      productId: json['productId'] as int?,
      coachId: json['coachId'] as int?,
      date: json['date'] as String?,
      fromTime: json['fromTime'] as String?,
      toTime: json['toTime'] as String?,
      isValid: json['isValid'] as bool?,
      status: json['status'] as int?,
      coachPrice: (json['coachPrice'] as num?)?.toDouble(),
      clubCost: (json['clubCost'] as num?)?.toDouble(),
      serviceCost: (json['serviceCost'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      coachName: json['coachName'] as String?,
      couponPercentage: json['couponPercentage'] as int?,
      couponAmount: (json['couponAmount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      discountPercentage: json['discountPercentage'] as int?,
      vatAmount: json['vatAmount'] as num?,
      coachLevel: json['coachLevel'] as int?,
      gender: json['gender'] as int?,
      rank: json['rank'] as int?,
      age: json['age'] as int?,
      profileImageUrl: json['profileImageUrl'] as String?,
      description: json['description'] as String?,
    );
  }
}
