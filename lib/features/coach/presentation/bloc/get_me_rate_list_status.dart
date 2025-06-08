import 'package:aloplay_simulation/features/coach/data/models/coach_rate_model.dart';
import 'package:equatable/equatable.dart';

abstract class PublicCoachGetMeRateListStatus extends Equatable {}

// loading status
class PublicCoachGetMeRateListLoading extends PublicCoachGetMeRateListStatus {
  @override
  List<Object?> get props => [];
}

// success status
class PublicCoachGetMeRateListSuccess extends PublicCoachGetMeRateListStatus {
  final List<PublicCoachRateModel> response;
  PublicCoachGetMeRateListSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

// error status
class PublicCoachGetMeRateListError extends PublicCoachGetMeRateListStatus {
  final String errorMsg;
  PublicCoachGetMeRateListError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
