part of 'public_coach_manage_bloc.dart';

abstract class PublicCoachManageEvent extends Equatable {
  const PublicCoachManageEvent();
}

// get all public coaches request
class PublicCoachGetAllRequest extends PublicCoachManageEvent {
  final int? page;
  final String? searchKey;
  final int? userId;
  final List<int>? cityIds;
  final List<int>? levels;
  final int? clubId;
  final bool needRefresh;

  const PublicCoachGetAllRequest({
    required this.page,
    this.searchKey,
    this.userId,
    this.cityIds,
    this.levels,
    this.clubId,
    this.needRefresh = true,
  });

  @override
  List<Object?> get props => [
        page,
        searchKey,
        userId,
        cityIds,
        levels,
        clubId,
        needRefresh,
      ];
}

// get single public coach with ID request
class PublicCoachGetSingleRequest extends PublicCoachManageEvent {
  final int id;

  const PublicCoachGetSingleRequest({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

// search for reserve and get coaches request
class PublicCoachSearchForReserveRequest extends PublicCoachManageEvent {
  final int? clubId;
  final List<Map<String, dynamic>>? coachs;

  const PublicCoachSearchForReserveRequest({
    required this.clubId,
    required this.coachs,
  });

  @override
  List<Object?> get props => [clubId, coachs];
}

// get coach rate request
class PublicCoachGetRateRequest extends PublicCoachManageEvent {
  final bool needRefresh;
  final int coachId;

  const PublicCoachGetRateRequest({
    this.needRefresh = true,
    required this.coachId,
  });

  @override
  List<Object?> get props => [needRefresh];
}

// get list of rates that i have given to coaches request
class PublicCoachGetMeRateListRequest extends PublicCoachManageEvent {
  @override
  List<Object?> get props => [];
}

// add new rate for coach request
class PublicCoachAddRateRequest extends PublicCoachManageEvent {
  final int? coachId;
  final int? punctuality;
  final int? skill;
  final int? performance;

  const PublicCoachAddRateRequest({
    required this.coachId,
    required this.punctuality,
    required this.skill,
    required this.performance,
  });

  @override
  List<Object?> get props => [
        coachId,
        punctuality,
        skill,
        performance,
      ];
}

// get all coach clubs request
class PublicCoachGetClubsRequest extends PublicCoachManageEvent {
  final int? page;
  final int? coachId;
  final int? sort;
  final int? cityId;
  final String? searchKey;
  final bool needRefresh;
  final double? userLat;
  final double? userLong;

  const PublicCoachGetClubsRequest({
    required this.page,
    required this.coachId,
    this.sort,
    this.cityId,
    this.searchKey,
    this.userLat,
    this.userLong,
    this.needRefresh = true,
  });

  @override
  List<Object?> get props => [
        page,
        coachId,
        sort,
        cityId,
        searchKey,
        userLat,
        userLong,
        needRefresh,
      ];
}
