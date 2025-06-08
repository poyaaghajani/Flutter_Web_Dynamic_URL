part of 'get_by_time_bloc.dart';

abstract class GetProductByTimeState extends Equatable {
  const GetProductByTimeState();
}

class GetProductByTimeInit extends GetProductByTimeState {
  @override
  List<Object?> get props => [];
}

class GetProductByTimeLoading extends GetProductByTimeState {
  @override
  List<Object?> get props => [];
}

class GetProductByTimeCompleted extends GetProductByTimeState {
  final Either<String, List<ProductByTimeModel>> response;
  const GetProductByTimeCompleted(this.response);

  @override
  List<Object?> get props => [response];
}
