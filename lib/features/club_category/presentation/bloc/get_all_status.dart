import 'package:aloplay_simulation/features/club_category/data/models/club_categories_model.dart';
import 'package:equatable/equatable.dart';

abstract class ClubCategoryGetAllStatus extends Equatable {}

// loading status
class ClubCategoryGetAllLoading extends ClubCategoryGetAllStatus {
  @override
  List<Object?> get props => [];
}

// categories success status
class ClubCategoryGetAllSuccess extends ClubCategoryGetAllStatus {
  final ClubCategoriesModel clubCategories;

  ClubCategoryGetAllSuccess(this.clubCategories);

  @override
  List<Object?> get props => [clubCategories];
}

// error status
class ClubCategoryGetAllError extends ClubCategoryGetAllStatus {
  final String errorMsg;
  ClubCategoryGetAllError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
