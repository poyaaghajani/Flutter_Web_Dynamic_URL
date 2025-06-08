class PublicCoachRateModel {
  final double? punctuality;
  final double? skill;
  final double? performance;

  PublicCoachRateModel({
    required this.punctuality,
    required this.skill,
    required this.performance,
  });

  factory PublicCoachRateModel.fromJson(Map<String, dynamic> json) {
    return PublicCoachRateModel(
      punctuality: json['punctuality'],
      skill: json['skill'],
      performance: json['performance'],
    );
  }
}
