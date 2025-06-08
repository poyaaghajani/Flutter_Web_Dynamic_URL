part of 'public_coach_manage_bloc.dart';

class PublicCoachManageState extends Equatable {
  final PublicCoachGetAllStatus getAllStatus;
  final PublicCoachGetSingleStatus getSingleStatus;

  const PublicCoachManageState({
    required this.getAllStatus,
    required this.getSingleStatus,
  });

  PublicCoachManageState copyWith({
    PublicCoachGetAllStatus? newGetAllStatus,
    PublicCoachGetSingleStatus? newGetSingleStatus,
  }) {
    return PublicCoachManageState(
      getAllStatus: newGetAllStatus ?? getAllStatus,
      getSingleStatus: newGetSingleStatus ?? getSingleStatus,
    );
  }

  @override
  List<Object> get props => [getAllStatus, getSingleStatus];
}
