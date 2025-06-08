import 'package:aloplay_simulation/features/coach/data/models/single_coach_model.dart';
import 'package:equatable/equatable.dart';

abstract class PublicCoachGetSingleStatus extends Equatable {}

// loading status
class PublicCoachGetSingleLoading extends PublicCoachGetSingleStatus {
  @override
  List<Object?> get props => [];
}

// success status
class PublicCoachGetSingleSuccess extends PublicCoachGetSingleStatus {
  final PublicSingleCoachModel response;
  PublicCoachGetSingleSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

// error status
class PublicCoachGetSingleError extends PublicCoachGetSingleStatus {
  final String erroMsg;
  PublicCoachGetSingleError(this.erroMsg);

  @override
  List<Object?> get props => [erroMsg];
}
