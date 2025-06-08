class PublicClubOnlinePackagesModel {
  final int? id;
  final int? cityId;
  final String? lastReservedForPlayer;
  final String? name;
  final String? logoUrl;
  final String? cityName;
  final String? address;
  final String? rules;
  final String? website;
  final String? preSaleDate;
  final String? logoData;
  final String? description;
  final int? orderId;
  final bool? hasLockerroom;
  final bool? hasBuffet;
  final bool? hasShower;
  final bool? hasBallBoy;
  final bool? hasParking;
  final bool? hasTournament;
  final bool? hasRestaurant;
  final bool? hasGroupLesson;
  final bool? hasGym;
  final bool? hasPool;
  final bool? hasIndoorCourt;
  final bool? hasPlayerSeat;
  final bool? hasPlayerUmbrella;
  final List<Files>? files;
  final Priceing? priceing;

  PublicClubOnlinePackagesModel({
    required this.id,
    required this.cityId,
    required this.lastReservedForPlayer,
    required this.name,
    required this.logoUrl,
    required this.cityName,
    required this.address,
    required this.rules,
    required this.website,
    required this.preSaleDate,
    required this.logoData,
    required this.description,
    required this.orderId,
    required this.hasLockerroom,
    required this.hasBuffet,
    required this.hasShower,
    required this.hasBallBoy,
    required this.hasParking,
    required this.hasTournament,
    required this.hasRestaurant,
    required this.hasGroupLesson,
    required this.hasGym,
    required this.hasPool,
    required this.hasIndoorCourt,
    required this.hasPlayerSeat,
    required this.hasPlayerUmbrella,
    required this.files,
    required this.priceing,
  });

  factory PublicClubOnlinePackagesModel.fromJson(Map<String, dynamic> json) {
    List<Files> files = <Files>[];
    if (json['files'] != null) {
      json['files'].forEach((v) {
        files.add(Files.fromJson(v));
      });
    }

    return PublicClubOnlinePackagesModel(
      id: json['id'],
      cityId: json['cityId'],
      lastReservedForPlayer: json['lastReservedForPlayer'],
      name: json['name'],
      logoUrl: json['logoUrl'],
      cityName: json['cityName'],
      address: json['address'],
      rules: json['rules'],
      website: json['website'],
      preSaleDate: json['preSaleDate'],
      logoData: json['logoData'],
      description: json['description'],
      orderId: json['orderId'],
      hasLockerroom: json['hasLockerroom'],
      hasBuffet: json['hasBuffet'],
      hasShower: json['hasShower'],
      hasBallBoy: json['hasBallBoy'],
      hasParking: json['hasParking'],
      hasTournament: json['hasTournament'],
      hasRestaurant: json['hasRestaurant'],
      hasGroupLesson: json['hasGroupLesson'],
      hasGym: json['hasGym'],
      hasPool: json['hasPool'],
      hasIndoorCourt: json['hasIndoorCourt'],
      hasPlayerSeat: json['hasPlayerSeat'],
      hasPlayerUmbrella: json['hasPlayerUmbrella'],
      files: files,
      priceing:
          json['priceing'] != null ? Priceing.fromJson(json['priceing']) : null,
    );
  }
}

class Files {
  final int? clubId;
  final int? newsId;
  final int? packageId;
  final int? id;
  final int? type;
  final String? title;
  final String? url;

  Files({
    required this.clubId,
    required this.newsId,
    required this.packageId,
    required this.id,
    required this.type,
    required this.title,
    required this.url,
  });

  factory Files.fromJson(Map<String, dynamic> json) {
    return Files(
      clubId: json['clubId'],
      newsId: json['newsId'],
      packageId: json['packageId'],
      id: json['id'],
      type: json['type'],
      title: json['title'],
      url: json['url'],
    );
  }
}

class Priceing {
  final double? minPrice;
  final double? maxDiscount;

  Priceing({
    required this.minPrice,
    required this.maxDiscount,
  });

  factory Priceing.fromJson(Map<String, dynamic> json) {
    return Priceing(
      minPrice: json['minPrice'],
      maxDiscount: json['maxDiscount'],
    );
  }
}
