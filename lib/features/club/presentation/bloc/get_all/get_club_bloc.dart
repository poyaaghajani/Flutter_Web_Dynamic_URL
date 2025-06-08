import 'package:aloplay_simulation/features/club/data/models/club_model.dart';
import 'package:aloplay_simulation/features/club/data/params/public_club_params.dart';
import 'package:aloplay_simulation/features/club/data/repository/club_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'get_club_event.dart';
part 'get_club_state.dart';

class GetPublicClubBloc extends Bloc<GetPublicClubEvent, GetPublicClubState> {
  final IPublicClubRepository publicClubRepository;

  GetPublicClubBloc(this.publicClubRepository) : super(GetPublicClubLoading()) {
    on<GetAllPublicClubsRequest>((event, emit) async {
      if (event.needRefresh) {
        emit(GetPublicClubLoading());
      }

      var allPublicClubs = await publicClubRepository.getAllPublicClubs(
        PublicClubGetParams(
          page: event.page,
          sort: event.sort,
          clubId: event.clubId,
          cityId: event.cityId,
          searchKey: event.searchKey,
          userLat: event.userLat,
          userLong: event.userLong,
        ),
      );

      emit(GetPublicClubCompleted(allPublicClubs));
    });
  }
}
