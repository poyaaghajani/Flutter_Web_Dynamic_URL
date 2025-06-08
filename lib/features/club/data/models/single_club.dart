class SinglePublicClubModel {
  final String? rules;
  final String? website;
  final String? preSaleDate;
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
  final bool? hasNightLighting;
  final double? lat;
  final double? long;
  final int? id;
  final int? cityId;
  final int? clubCategoryId;
  final String? name;
  final String? logoUrl;
  final String? cityName;
  final String? clubCategoryTitle;
  final String? address;
  final String? logoData;
  final String? description;
  final int? orderId;
  final String? lastReservedForPlayer;
  final int? preSaleDay;
  final double? distance;
  final double? rate;
  final bool? isActiveReserve;
  final List<File>? files;
  final Pricing? priceing;

  SinglePublicClubModel({
    required this.rules,
    required this.website,
    required this.preSaleDate,
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
    required this.hasNightLighting,
    required this.lat,
    required this.long,
    required this.id,
    required this.cityId,
    required this.clubCategoryId,
    required this.name,
    required this.logoUrl,
    required this.cityName,
    required this.clubCategoryTitle,
    required this.address,
    required this.logoData,
    required this.description,
    required this.orderId,
    required this.lastReservedForPlayer,
    required this.preSaleDay,
    required this.distance,
    required this.rate,
    required this.isActiveReserve,
    required this.files,
    required this.priceing,
  });

  factory SinglePublicClubModel.fromJson(Map<String, dynamic> json) {
    return SinglePublicClubModel(
      rules: json['rules'] as String?,
      website: json['website'] as String?,
      preSaleDate: json['preSaleDate'] as String?,
      hasLockerroom: json['hasLockerroom'] as bool?,
      hasBuffet: json['hasBuffet'] as bool?,
      hasShower: json['hasShower'] as bool?,
      hasBallBoy: json['hasBallBoy'] as bool?,
      hasParking: json['hasParking'] as bool?,
      hasTournament: json['hasTournament'] as bool?,
      hasRestaurant: json['hasRestaurant'] as bool?,
      hasGroupLesson: json['hasGroupLesson'] as bool?,
      hasGym: json['hasGym'] as bool?,
      hasPool: json['hasPool'] as bool?,
      hasIndoorCourt: json['hasIndoorCourt'] as bool?,
      hasPlayerSeat: json['hasPlayerSeat'] as bool?,
      hasPlayerUmbrella: json['hasPlayerUmbrella'] as bool?,
      hasNightLighting: json['hasNightLighting'] as bool?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      id: json['id'] as int?,
      cityId: json['cityId'] as int?,
      clubCategoryId: json['clubCategoryId'] as int?,
      name: json['name'] as String?,
      logoUrl: json['logoUrl'] as String?,
      cityName: json['cityName'] as String?,
      clubCategoryTitle: json['clubCategoryTitle'] as String?,
      address: json['address'] as String?,
      logoData: json['logoData'] as String?,
      description: json['description'] as String?,
      orderId: json['orderId'] as int?,
      lastReservedForPlayer: json['lastReservedForPlayer'] as String?,
      preSaleDay: json['preSaleDay'] as int?,
      distance: (json['distance'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      isActiveReserve: json['isActiveReserve'] as bool?,
      files:
          json['files'] != null
              ? (json['files'] as List).map((e) => File.fromJson(e)).toList()
              : null,
      priceing:
          json['priceing'] != null ? Pricing.fromJson(json['priceing']) : null,
    );
  }
}

class File {
  final int? clubId;
  final int? newsId;
  final int? packageId;
  final int? id;
  final int? type;
  final String? title;
  final String? url;

  File({
    required this.clubId,
    required this.newsId,
    required this.packageId,
    required this.id,
    required this.type,
    required this.title,
    required this.url,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      clubId: json['clubId'] as int?,
      newsId: json['newsId'] as int?,
      packageId: json['packageId'] as int?,
      id: json['id'] as int?,
      type: json['type'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );
  }
}

class Pricing {
  final double? minPrice;
  final double? maxDiscount;

  Pricing({required this.minPrice, required this.maxDiscount});

  factory Pricing.fromJson(Map<String, dynamic> json) {
    return Pricing(
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxDiscount: (json['maxDiscount'] as num?)?.toDouble(),
    );
  }
}
