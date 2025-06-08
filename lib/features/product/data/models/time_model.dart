class TimeModel {
  final String? fromTime;
  final String? toTime;

  TimeModel({
    required this.fromTime,
    required this.toTime,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      fromTime: json['fromTime'],
      toTime: json['toTime'],
    );
  }
}
