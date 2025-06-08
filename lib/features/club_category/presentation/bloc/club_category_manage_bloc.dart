import 'package:aloplay_simulation/features/club_category/data/repository/club_category_repository.dart';
import 'package:aloplay_simulation/features/club_category/presentation/bloc/get_all_status.dart';
import 'package:aloplay_simulation/features/club_category/presentation/bloc/get_by_club_id_status.dart';
import 'package:aloplay_simulation/features/club_category/presentation/bloc/get_by_parent_id_status.dart';
import 'package:aloplay_simulation/features/club_category/presentation/bloc/get_single_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'club_category_manage_event.dart';
part 'club_category_manage_state.dart';

class ClubCategoryManageBloc
    extends Bloc<ClubCategoryManageEvent, ClubCategoryManageState> {
  final IClubCategoryRepository clubCategoryRepo;

  ClubCategoryManageBloc(this.clubCategoryRepo)
    : super(
        ClubCategoryManageState(
          getAllStatus: ClubCategoryGetAllLoading(),
          getSingleStatus: ClubCategoryGetSingleLoading(),
          getByClubIdStatus: ClubCategoryGetByClubIdInit(),
          getByParentIdStatus: ClubCategoryGetByParentIdInit(),
        ),
      ) {
    on<ClubCategoryGetAllRequest>(onClubCategoryGetAllRequest);
    on<ClubCategoryGetByClubIdRequest>(onClubCategoryGetByClubIdRequest);
    on<ClubCategoryGetByParentIdRequest>(onClubCategoryGetByParentIdRequest);
  }

  /// when user want see all club categories to select one of them also all public clubs, this event will be triggered
  onClubCategoryGetAllRequest(
    ClubCategoryGetAllRequest event,
    Emitter<ClubCategoryManageState> emit,
  ) async {
    if (event.needRefresh) {
      emit(state.copyWith(newGetAllStatus: ClubCategoryGetAllLoading()));
    }

    var clubCategories = await clubCategoryRepo.getClubCategories(
      event.page,
      event.searchKey,
    );

    clubCategories.fold(
      (error) =>
          emit(state.copyWith(newGetAllStatus: ClubCategoryGetAllError(error))),
      (success) => emit(
        state.copyWith(newGetAllStatus: ClubCategoryGetAllSuccess(success)),
      ),
    );
  }

  /// Get all clubCategories by clubId
  onClubCategoryGetByClubIdRequest(
    ClubCategoryGetByClubIdRequest event,
    Emitter<ClubCategoryManageState> emit,
  ) async {
    emit(
      state.copyWith(newGetByClubIdStatus: ClubCategoryGetByClubIdLoading()),
    );

    final response = await clubCategoryRepo.getByClubId(event.clubId);

    response.fold(
      (error) => emit(
        state.copyWith(
          newGetByClubIdStatus: ClubCategoryGetByClubIdError(error),
        ),
      ),
      (success) => emit(
        state.copyWith(
          newGetByClubIdStatus: ClubCategoryGetByClubIdSuccess(success),
        ),
      ),
    );
  }

  /// Get all clubCategories by parentId
  onClubCategoryGetByParentIdRequest(
    ClubCategoryGetByParentIdRequest event,
    Emitter<ClubCategoryManageState> emit,
  ) async {
    emit(
      state.copyWith(
        newGetByParentIdStatus: ClubCategoryGetByParentIdLoading(),
      ),
    );

    final response = await clubCategoryRepo.getByParentId();

    response.fold(
      (error) => emit(
        state.copyWith(
          newGetByParentIdStatus: ClubCategoryGetByParentIdError(error),
        ),
      ),
      (success) => emit(
        state.copyWith(
          newGetByParentIdStatus: ClubCategoryGetByParentIdSuccess(success),
        ),
      ),
    );
  }
}
