class CoachSearchForReserveModel {
  final int? productId;
  final int? coachId;
  final String? date;
  final String? fromTime;
  final String? toTime;
  final int? coachLevel;
  final int? status;
  final bool? isValid;
  final double? coachCost;
  final double? serviceCost;
  final int? rank;
  final int? age;
  final String? coachName;
  final String? profileImageUrl;
  final String? description;

  CoachSearchForReserveModel({
    required this.productId,
    required this.coachId,
    required this.date,
    required this.fromTime,
    required this.toTime,
    required this.coachLevel,
    required this.status,
    required this.isValid,
    required this.coachCost,
    required this.serviceCost,
    required this.rank,
    required this.age,
    required this.coachName,
    required this.profileImageUrl,
    required this.description,
  });

  factory CoachSearchForReserveModel.fromJson(Map<String, dynamic> json) {
    return CoachSearchForReserveModel(
      productId: json['productId'] as int?,
      coachId: json['coachId'] as int?,
      date: json['date'] as String?,
      fromTime: json['fromTime'] as String?,
      toTime: json['toTime'] as String?,
      coachLevel: json['coachLevel'] as int?,
      status: json['status'] as int?,
      isValid: json['isValid'] as bool?,
      coachCost: json['coachCost'] as double?,
      serviceCost: json['serviceCost'] as double?,
      rank: json['rank'] as int?,
      age: json['age'] as int?,
      coachName: json['coachName'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      description: json['description'] as String?,
    );
  }
}
