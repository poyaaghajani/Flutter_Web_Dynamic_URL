import 'package:aloplay_simulation/features/coach/data/models/coach_rate_model.dart';
import 'package:equatable/equatable.dart';

abstract class PublicCoachGetRateStatus extends Equatable {}

// loading status
class PublicCoachGetRateLoading extends PublicCoachGetRateStatus {
  @override
  List<Object?> get props => [];
}

// success status
class PublicCoachGetRateSuccess extends PublicCoachGetRateStatus {
  final PublicCoachRateModel response;
  PublicCoachGetRateSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

// error status
class PublicCoachGetRateError extends PublicCoachGetRateStatus {
  final String errorMsg;
  PublicCoachGetRateError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
