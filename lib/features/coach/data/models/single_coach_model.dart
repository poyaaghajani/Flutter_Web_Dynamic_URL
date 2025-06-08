class PublicSingleCoachModel {
  final int? id;
  final int? cityId;
  final String? firstName;
  final String? lastName;
  final String? cityName;
  final String? mobile;
  final String? email;
  final String? publicMobile;
  final String? instagram;
  final String? website;
  final int? gender;
  final String? birthDate;
  final int? age;
  final int? coachLevel;
  final List<String>? clubNames;
  final List<String>? documentUrls;
  final String? description;
  final String? profileImageUrl;

  PublicSingleCoachModel({
    required this.id,
    required this.cityId,
    required this.firstName,
    required this.lastName,
    required this.cityName,
    required this.mobile,
    required this.email,
    required this.publicMobile,
    required this.instagram,
    required this.website,
    required this.gender,
    required this.birthDate,
    required this.age,
    required this.coachLevel,
    required this.clubNames,
    required this.documentUrls,
    required this.description,
    required this.profileImageUrl,
  });

  factory PublicSingleCoachModel.fromJson(Map<String, dynamic> json) {
    return PublicSingleCoachModel(
      id: json['id'],
      cityId: json['cityId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      cityName: json['cityName'],
      mobile: json['mobile'],
      email: json['email'],
      publicMobile: json['publicMobile'],
      instagram: json['instagram'],
      website: json['website'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      age: json['age'],
      coachLevel: json['coachLevel'],
      clubNames: List<String>.from(json['clubNames'] ?? []),
      documentUrls: List<String>.from(json['documentUrls'] ?? []),
      description: json['description'],
      profileImageUrl: json['profileImageUrl'],
    );
  }
}
