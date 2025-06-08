part of 'get_club_bloc.dart';

@immutable
abstract class GetPublicClubEvent extends Equatable {}

class GetAllPublicClubsRequest extends GetPublicClubEvent {
  final int? page;
  final int? sort;
  final int? clubId;
  final int? cityId;
  final String? searchKey;
  final bool needRefresh;
  final double? userLat;
  final double? userLong;

  GetAllPublicClubsRequest({
    required this.page,
    this.sort,
    this.clubId,
    this.cityId,
    this.searchKey,
    this.userLat,
    this.userLong,
    this.needRefresh = true,
  });

  @override
  List<Object?> get props => [
        page,
        sort,
        clubId,
        cityId,
        searchKey,
        userLat,
        userLong,
        needRefresh,
      ];
}
