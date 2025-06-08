class PublicCoachesModel {
  final List<Coach?>? data;
  final int? totalCount;
  final int? pageSize;
  final int? pageNo;

  PublicCoachesModel({
    required this.data,
    required this.totalCount,
    required this.pageSize,
    required this.pageNo,
  });

  factory PublicCoachesModel.fromJson(Map<String, dynamic> json) {
    return PublicCoachesModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((coach) => Coach.fromJson(coach))
          .toList(),
      totalCount: json['totalCount'],
      pageSize: json['pageSize'],
      pageNo: json['pageNo'],
    );
  }
}

class Coach {
  final int? id;
  final int? cityId;
  final String? firstName;
  final String? lastName;
  final String? cityName;
  final String? email;
  final String? dialCode;
  final double? coachCost;
  final double? rate;
  final String? publicMobile;
  final String? instagram;
  final String? website;
  final int? gender;
  final String? birthDate;
  final int? age;
  final int? coachLevel;
  final List<String?>? clubNames;
  final String? description;
  final String? profileImageUrl;

  Coach({
    required this.id,
    required this.cityId,
    required this.firstName,
    required this.lastName,
    required this.cityName,
    required this.dialCode,
    required this.coachCost,
    required this.rate,
    required this.email,
    required this.publicMobile,
    required this.instagram,
    required this.website,
    required this.gender,
    required this.birthDate,
    required this.age,
    required this.coachLevel,
    required this.clubNames,
    required this.description,
    required this.profileImageUrl,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json['id'],
      cityId: json['cityId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      cityName: json['cityName'],
      dialCode: json['dialCode'],
      coachCost: json['coachCost'],
      rate: json['rate'],
      email: json['email'],
      publicMobile: json['publicMobile'],
      instagram: json['instagram'],
      website: json['website'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      age: json['age'],
      coachLevel: json['coachLevel'],
      clubNames: (json['clubNames'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      description: json['description'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
