import 'package:equatable/equatable.dart';

abstract class PublicCoachAddRateStatus extends Equatable {}

// init status
class PublicCoachAddRateInit extends PublicCoachAddRateStatus {
  @override
  List<Object?> get props => [];
}

// loading status
class PublicCoachAddRateLoading extends PublicCoachAddRateStatus {
  @override
  List<Object?> get props => [];
}

// success status
class PublicCoachAddRateSuccess extends PublicCoachAddRateStatus {
  @override
  List<Object?> get props => [];
}

// error status
class PublicCoachAddRateError extends PublicCoachAddRateStatus {
  final String errorMsg;
  PublicCoachAddRateError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
