import 'package:aloplay_simulation/features/club/data/repository/club_repository.dart';
import 'package:aloplay_simulation/features/coach/data/params/get_coach_params.dart';
import 'package:aloplay_simulation/features/coach/data/repository/coach_repository.dart';
import 'package:aloplay_simulation/features/coach/presentation/bloc/get_all_status.dart';
import 'package:aloplay_simulation/features/coach/presentation/bloc/get_single_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'public_coach_manage_event.dart';
part 'public_coach_manage_state.dart';

class PublicCoachManageBloc
    extends Bloc<PublicCoachManageEvent, PublicCoachManageState> {
  final IPublicCoachRepository coachRepo;
  final IPublicClubRepository clubRepo;

  PublicCoachManageBloc(this.coachRepo, this.clubRepo)
    : super(
        PublicCoachManageState(
          getAllStatus: PublicCoachGetAllLoading(),
          getSingleStatus: PublicCoachGetSingleLoading(),
        ),
      ) {
    on<PublicCoachGetAllRequest>(onGetAllRequest);
    on<PublicCoachGetSingleRequest>(onGetSingleRequest);
  }

  // when user want see all coaches, this event will be triggered
  onGetAllRequest(
    PublicCoachGetAllRequest event,
    Emitter<PublicCoachManageState> emit,
  ) async {
    if (event.needRefresh) {
      emit(state.copyWith(newGetAllStatus: PublicCoachGetAllLoading()));
    }

    final response = await coachRepo.getAllCoaches(
      GetCoachesParams(
        page: event.page,
        searchKey: event.searchKey,
        userId: event.userId,
        cityIds: event.cityIds,
        levels: event.levels,
        clubId: event.clubId,
      ),
    );

    response.fold(
      (error) =>
          emit(state.copyWith(newGetAllStatus: PublicCoachGetAllError(error))),
      (success) => emit(
        state.copyWith(newGetAllStatus: PublicCoachGetAllSuccess(success)),
      ),
    );
  }

  // when user want see single coach with ID, this event will be triggered
  onGetSingleRequest(
    PublicCoachGetSingleRequest event,
    Emitter<PublicCoachManageState> emit,
  ) async {
    emit(state.copyWith(newGetSingleStatus: PublicCoachGetSingleLoading()));

    final response = await coachRepo.getCoach(event.id);

    response.fold(
      (error) => emit(
        state.copyWith(newGetSingleStatus: PublicCoachGetSingleError(error)),
      ),
      (success) => emit(
        state.copyWith(
          newGetSingleStatus: PublicCoachGetSingleSuccess(success),
        ),
      ),
    );
  }
}
