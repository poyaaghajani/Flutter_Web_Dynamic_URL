import 'package:aloplay_simulation/features/club/data/models/single_club.dart';
import 'package:aloplay_simulation/features/club/data/repository/club_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_single_club_event.dart';
part 'get_single_club_state.dart';

class GetSinglePublicClubBloc
    extends Bloc<GetSinglePublicClubEvent, GetSinglePublicClubState> {
  final IPublicClubRepository publicClubRepository;

  GetSinglePublicClubBloc(this.publicClubRepository)
    : super(GetSinglePublicClubLoading()) {
    on<GetSinglePublicClubRequest>((event, emit) async {
      emit(GetSinglePublicClubLoading());

      final response = await publicClubRepository.getPublicClubById(event.id);

      emit(GetSinglePublicClubCompleted(response));
    });
  }
}
