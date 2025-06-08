import 'package:aloplay_simulation/features/coach/data/models/coaches_model.dart';
import 'package:equatable/equatable.dart';

abstract class PublicCoachGetAllStatus extends Equatable {}

// loading status
class PublicCoachGetAllLoading extends PublicCoachGetAllStatus {
  @override
  List<Object?> get props => [];
}

// success status
class PublicCoachGetAllSuccess extends PublicCoachGetAllStatus {
  final PublicCoachesModel response;
  PublicCoachGetAllSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

// error status
class PublicCoachGetAllError extends PublicCoachGetAllStatus {
  final String errorMsg;
  PublicCoachGetAllError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
