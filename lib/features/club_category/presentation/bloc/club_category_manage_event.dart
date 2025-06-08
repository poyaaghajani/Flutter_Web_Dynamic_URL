part of 'club_category_manage_bloc.dart';

abstract class ClubCategoryManageEvent extends Equatable {
  const ClubCategoryManageEvent();
}

class ClubCategoryGetAllRequest extends ClubCategoryManageEvent {
  final bool needRefresh;
  final int page;
  final String? searchKey;

  const ClubCategoryGetAllRequest({
    this.needRefresh = true,
    required this.page,
    this.searchKey,
  });

  @override
  List<Object?> get props => [needRefresh, page, searchKey];
}

class ClubCategoryGetByClubIdRequest extends ClubCategoryManageEvent {
  final int clubId;

  const ClubCategoryGetByClubIdRequest({required this.clubId});

  @override
  List<Object?> get props => [clubId];
}

class ClubCategoryGetByParentIdRequest extends ClubCategoryManageEvent {
  @override
  List<Object?> get props => [];
}
