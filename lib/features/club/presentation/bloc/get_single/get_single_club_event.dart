part of 'get_single_club_bloc.dart';

abstract class GetSinglePublicClubEvent extends Equatable {
  const GetSinglePublicClubEvent();
}

class GetSinglePublicClubRequest extends GetSinglePublicClubEvent {
  final int id;

  const GetSinglePublicClubRequest({required this.id});

  @override
  List<Object?> get props => [id];
}
