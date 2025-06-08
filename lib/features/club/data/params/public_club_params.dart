class PublicClubGetParams {
  int? page;
  int? clubCategoryId;
  int? sort;
  int? clubId;
  int? coachId;
  int? cityId;
  String? searchKey;
  double? userLat;
  double? userLong;
  int? gender;
  int? packageType;
  bool? isMorning;
  bool? isEvening;
  bool? isNight;
  double? fromPrice;
  double? toPrice;
  bool? hasLockerRoom;
  bool? hasBuffet;
  bool? hasShower;
  bool? hasBallBoy;
  bool? hasParking;
  bool? hasTournament;
  bool? hasRestaurant;
  bool? hasGroupLesson;
  bool? hasGym;
  bool? hasPool;
  bool? hasIndoorCourt;
  bool? hasPlayerSeat;
  bool? hasPlayerUmbrella;
  bool? hasNightLighting;

  PublicClubGetParams({
    this.page,
    this.clubCategoryId,
    this.sort,
    this.clubId,
    this.coachId,
    this.cityId,
    this.searchKey,
    this.userLat,
    this.userLong,
    this.gender,
    this.packageType,
    this.isMorning,
    this.isEvening,
    this.isNight,
    this.fromPrice,
    this.toPrice,
    this.hasLockerRoom,
    this.hasBuffet,
    this.hasShower,
    this.hasBallBoy,
    this.hasParking,
    this.hasTournament,
    this.hasRestaurant,
    this.hasGroupLesson,
    this.hasGym,
    this.hasPool,
    this.hasIndoorCourt,
    this.hasPlayerSeat,
    this.hasPlayerUmbrella,
    this.hasNightLighting,
  });
}
