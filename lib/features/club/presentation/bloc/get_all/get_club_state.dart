part of 'get_club_bloc.dart';

@immutable
abstract class GetPublicClubState extends Equatable {}

// loading state
class GetPublicClubLoading extends GetPublicClubState {
  @override
  List<Object?> get props => [];
}

// completed state
class GetPublicClubCompleted extends GetPublicClubState {
  final Either<String, PublicClubModel> allPublicClubs;
  GetPublicClubCompleted(this.allPublicClubs);

  @override
  List<Object?> get props => [allPublicClubs];
}
