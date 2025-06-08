import 'package:aloplay_simulation/features/club_category/data/models/by_club_id_model.dart';
import 'package:equatable/equatable.dart';

abstract class ClubCategoryGetByClubIdStatus extends Equatable {}

class ClubCategoryGetByClubIdInit extends ClubCategoryGetByClubIdStatus {
  @override
  List<Object?> get props => [];
}

class ClubCategoryGetByClubIdLoading extends ClubCategoryGetByClubIdStatus {
  @override
  List<Object?> get props => [];
}

class ClubCategoryGetByClubIdSuccess extends ClubCategoryGetByClubIdStatus {
  final List<ClubCategoryByClubIdModel> response;

  ClubCategoryGetByClubIdSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class ClubCategoryGetByClubIdError extends ClubCategoryGetByClubIdStatus {
  final String errorMsg;
  ClubCategoryGetByClubIdError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
