part of 'get_available_time_bloc.dart';

abstract class GetProductAvailableTimeState extends Equatable {
  const GetProductAvailableTimeState();
}

// loding state
class GetProductAvailableTimeLoading extends GetProductAvailableTimeState {
  @override
  List<Object?> get props => [];
}

// completed state
class GetProductAvailableTimeCompleted extends GetProductAvailableTimeState {
  final Either<String, List<ProductAvailableTimeModel>> response;
  const GetProductAvailableTimeCompleted(this.response);

  @override
  List<Object?> get props => [response];
}
