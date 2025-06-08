import 'package:aloplay_simulation/features/club_category/data/models/by_parent_id_model.dart';
import 'package:equatable/equatable.dart';

abstract class ClubCategoryGetByParentIdStatus extends Equatable {}

class ClubCategoryGetByParentIdInit extends ClubCategoryGetByParentIdStatus {
  @override
  List<Object?> get props => [];
}

class ClubCategoryGetByParentIdLoading extends ClubCategoryGetByParentIdStatus {
  @override
  List<Object?> get props => [];
}

class ClubCategoryGetByParentIdSuccess extends ClubCategoryGetByParentIdStatus {
  final List<ClubCategoryByParentIdModel> response;

  ClubCategoryGetByParentIdSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class ClubCategoryGetByParentIdError extends ClubCategoryGetByParentIdStatus {
  final String errorMsg;
  ClubCategoryGetByParentIdError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
