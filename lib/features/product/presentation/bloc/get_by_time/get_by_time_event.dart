part of 'get_by_time_bloc.dart';

abstract class GetProductByTimeEvent extends Equatable {
  const GetProductByTimeEvent();
}

// get player product by time
class GetProductByTimeRequest extends GetProductByTimeEvent {
  final String? date;
  final String? time;
  final int? clubId;
  final int? productGender;

  const GetProductByTimeRequest({
    required this.date,
    required this.time,
    required this.clubId,
    required this.productGender,
  });

  @override
  List<Object?> get props => [
        date,
        time,
        clubId,
        productGender,
      ];
}
