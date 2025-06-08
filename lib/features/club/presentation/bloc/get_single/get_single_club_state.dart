part of 'get_single_club_bloc.dart';

@immutable
abstract class GetSinglePublicClubState extends Equatable {}

// loading state
class GetSinglePublicClubLoading extends GetSinglePublicClubState {
  @override
  List<Object?> get props => [];
}

// completed state
class GetSinglePublicClubCompleted extends GetSinglePublicClubState {
  final Either<String, SinglePublicClubModel> club;
  GetSinglePublicClubCompleted(this.club);

  @override
  List<Object?> get props => [club];
}
