import 'package:aloplay_simulation/features/product/data/models/all_products_model.dart';
import 'package:aloplay_simulation/features/product/data/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  final IProductRepository repository;

  GetAllProductsBloc(this.repository) : super(GetAllProductsLoading()) {
    on<GetAllProductsRequest>(onGetAllProductsRequest);
  }

  // when user want see all products, this event will be triggered
  onGetAllProductsRequest(
    GetAllProductsRequest event,
    Emitter<GetAllProductsState> emit,
  ) async {
    emit(GetAllProductsLoading());

    var response = await repository.getAllProducts(event.clubId);

    emit(GetAllProductsCompleted(response));
  }
}
