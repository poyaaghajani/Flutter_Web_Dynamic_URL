import 'package:aloplay_simulation/features/product/data/models/available_time_model.dart';
import 'package:aloplay_simulation/features/product/data/params/product_params.dart';
import 'package:aloplay_simulation/features/product/data/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_available_time_event.dart';
part 'get_available_time_state.dart';

class GetProductAvailableTimeBloc
    extends Bloc<GetProductAvailableTimeEvent, GetProductAvailableTimeState> {
  final IProductRepository repository;

  GetProductAvailableTimeBloc(this.repository)
    : super(GetProductAvailableTimeLoading()) {
    on<GetProductAvailableTimeRequest>(onGetProductAvailableTimeRequest);
  }

  // when user want see product avaliable times, this event will be triggered
  onGetProductAvailableTimeRequest(
    GetProductAvailableTimeRequest event,
    Emitter<GetProductAvailableTimeState> emit,
  ) async {
    emit(GetProductAvailableTimeLoading());

    var response = await repository.getProductAvailableTimes(
      ProductParams(
        id: event.id,
        date: event.date,
        productGender: event.productGender,
      ),
    );

    emit(GetProductAvailableTimeCompleted(response));
  }
}
