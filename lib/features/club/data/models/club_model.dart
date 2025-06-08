class PublicClubModel {
  final List<Club>? data;
  final int? totalCount;
  final int? pageSize;
  final int? pageNo;

  PublicClubModel({
    required this.data,
    required this.totalCount,
    required this.pageSize,
    required this.pageNo,
  });

  factory PublicClubModel.fromJson(Map<String, dynamic> json) {
    return PublicClubModel(
      data:
          json['data'] != null
              ? (json['data'] as List).map((e) => Club.fromJson(e)).toList()
              : null,
      totalCount: json['totalCount'] as int?,
      pageSize: json['pageSize'] as int?,
      pageNo: json['pageNo'] as int?,
    );
  }
}

class Club {
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
  final String? preSaleDate;
  final String? lastReservedForPlayer;
  final int? preSaleDay;
  final double? lat;
  final double? long;
  final double? distance;
  final double? rate;
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
  final bool? isActiveReserve;
  final List<File>? files;
  final Pricing? priceing;

  Club({
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
    required this.preSaleDate,
    required this.lastReservedForPlayer,
    required this.preSaleDay,
    required this.lat,
    required this.long,
    required this.distance,
    required this.rate,
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
    required this.isActiveReserve,
    required this.files,
    required this.priceing,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
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
      preSaleDate: json['preSaleDate'] as String?,
      lastReservedForPlayer: json['lastReservedForPlayer'] as String?,
      preSaleDay: json['preSaleDay'] as int?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
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
