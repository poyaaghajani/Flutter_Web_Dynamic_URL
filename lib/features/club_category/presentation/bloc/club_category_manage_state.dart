part of 'club_category_manage_bloc.dart';

class ClubCategoryManageState extends Equatable {
  final ClubCategoryGetAllStatus getAllStatus;
  final ClubCategoryGetSingleStatus getSingleStatus;
  final ClubCategoryGetByClubIdStatus getByClubIdStatus;
  final ClubCategoryGetByParentIdStatus getByParentIdStatus;

  const ClubCategoryManageState({
    required this.getAllStatus,
    required this.getSingleStatus,
    required this.getByClubIdStatus,
    required this.getByParentIdStatus,
  });

  ClubCategoryManageState copyWith({
    ClubCategoryGetAllStatus? newGetAllStatus,
    ClubCategoryGetSingleStatus? newGetSingleStatus,
    ClubCategoryGetByClubIdStatus? newGetByClubIdStatus,
    ClubCategoryGetByParentIdStatus? newGetByParentIdStatus,
  }) {
    return ClubCategoryManageState(
      getAllStatus: newGetAllStatus ?? getAllStatus,
      getSingleStatus: newGetSingleStatus ?? getSingleStatus,
      getByClubIdStatus: newGetByClubIdStatus ?? getByClubIdStatus,
      getByParentIdStatus: newGetByParentIdStatus ?? getByParentIdStatus,
    );
  }

  @override
  List<Object> get props => [
    getAllStatus,
    getSingleStatus,
    getByClubIdStatus,
    getByParentIdStatus,
  ];
}
