class GetCoachesParams {
  int? page;
  String? searchKey;
  int? userId;
  List<int?>? cityIds;
  List<int?>? levels;
  int? cityId;
  int? level;
  int? clubId;

  GetCoachesParams({
    this.page,
    this.searchKey,
    this.userId,
    this.cityIds,
    this.levels,
    this.cityId,
    this.level,
    this.clubId,
  });
}
