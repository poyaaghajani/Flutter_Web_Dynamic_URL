import 'package:aloplay_simulation/features/club/data/models/club_model.dart';
import 'package:equatable/equatable.dart';

abstract class PublicCoachGetClubsStatus extends Equatable {}

// loading status
class PublicCoachGetClubsLoading extends PublicCoachGetClubsStatus {
  @override
  List<Object?> get props => [];
}

// success status
class PublicCoachGetClubsSuccess extends PublicCoachGetClubsStatus {
  final PublicClubModel response;
  PublicCoachGetClubsSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

// error status
class PublicCoachGetClubsError extends PublicCoachGetClubsStatus {
  final String errorMsg;
  PublicCoachGetClubsError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
