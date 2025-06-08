part of 'get_available_time_bloc.dart';

abstract class GetProductAvailableTimeEvent extends Equatable {
  const GetProductAvailableTimeEvent();
}

// get product available times request by date
class GetProductAvailableTimeRequest extends GetProductAvailableTimeEvent {
  final String date;
  final int id;
  final int productGender;

  const GetProductAvailableTimeRequest({
    required this.id,
    required this.date,
    required this.productGender,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        productGender,
      ];
}
