class PublicClubRepeatWeekModel {
  final List<int>? data;

  PublicClubRepeatWeekModel({required this.data});

  factory PublicClubRepeatWeekModel.fromJson(Map<String, dynamic> json) {
    return PublicClubRepeatWeekModel(
      data: json['data'].cast<int>(),
    );
  }
}
