part of 'get_genders_bloc.dart';

abstract class GetProductGendersEvent extends Equatable {
  const GetProductGendersEvent();
}

// get product gendrs request
class GetProductGendersRequest extends GetProductGendersEvent {
  final int clubId;
  const GetProductGendersRequest({required this.clubId});

  @override
  List<Object?> get props => [clubId];
}
