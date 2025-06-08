class PublicClubRulesModel {
  final int? clubId;
  final bool isRequiredAcceptRules;
  final String? rules;

  PublicClubRulesModel({
    required this.clubId,
    required this.isRequiredAcceptRules,
    required this.rules,
  });

  factory PublicClubRulesModel.fromJson(Map<String, dynamic> json) {
    return PublicClubRulesModel(
      clubId: json['clubId'],
      isRequiredAcceptRules: json['isRequiredAcceptRules'],
      rules: json['rules'],
    );
  }
}
