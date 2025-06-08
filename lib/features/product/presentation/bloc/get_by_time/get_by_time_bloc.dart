import 'package:aloplay_simulation/features/product/data/models/by_time_model.dart';
import 'package:aloplay_simulation/features/product/data/params/product_params.dart';
import 'package:aloplay_simulation/features/product/data/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_by_time_event.dart';
part 'get_by_time_state.dart';

class GetProductByTimeBloc
    extends Bloc<GetProductByTimeEvent, GetProductByTimeState> {
  final IProductRepository repository;

  GetProductByTimeBloc(this.repository) : super(GetProductByTimeInit()) {
    on<GetProductByTimeRequest>(onGetProductByTimeRequest);
  }

  // when user want see product by time, this event will be triggered
  onGetProductByTimeRequest(
    GetProductByTimeRequest event,
    Emitter<GetProductByTimeState> emit,
  ) async {
    emit(GetProductByTimeLoading());

    var response = await repository.getProductByTime(
      ProductParams(
        id: event.clubId,
        date: event.date,
        time: event.time,
        productGender: event.productGender,
      ),
    );

    emit(GetProductByTimeCompleted(response));
  }
}
