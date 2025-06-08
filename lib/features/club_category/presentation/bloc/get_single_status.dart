import 'package:aloplay_simulation/features/club_category/data/models/club_categories_model.dart';
import 'package:equatable/equatable.dart';

abstract class ClubCategoryGetSingleStatus extends Equatable {}

// loading status
class ClubCategoryGetSingleLoading extends ClubCategoryGetSingleStatus {
  @override
  List<Object?> get props => [];
}

// success status
class ClubCategoryGetSingleSuccess extends ClubCategoryGetSingleStatus {
  final ClubCategoryModel response;

  ClubCategoryGetSingleSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

// error status
class ClubCategoryGetSingleError extends ClubCategoryGetSingleStatus {
  final String errorMsg;
  ClubCategoryGetSingleError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
