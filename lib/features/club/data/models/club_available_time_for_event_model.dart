class PublicClubAvailableTimeForEventModel {
  final String? fromTime;
  final String? toTime;

  PublicClubAvailableTimeForEventModel({
    required this.fromTime,
    required this.toTime,
  });

  factory PublicClubAvailableTimeForEventModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PublicClubAvailableTimeForEventModel(
      fromTime: json['fromTime'],
      toTime: json['toTime'],
    );
  }
}
