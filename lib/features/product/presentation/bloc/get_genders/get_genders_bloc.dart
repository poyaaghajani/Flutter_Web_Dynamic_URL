import 'package:aloplay_simulation/features/product/data/models/gender_model.dart';
import 'package:aloplay_simulation/features/product/data/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'get_genders_event.dart';
part 'get_genders_state.dart';

class GetProductGendersBloc
    extends Bloc<GetProductGendersEvent, GetProductGendersState> {
  final IProductRepository repository;

  GetProductGendersBloc(this.repository) : super(GetProductGendersLoading()) {
    on<GetProductGendersRequest>(onGetProductGendersRequest);
  }

  // when user want see product genders, this event will be triggered
  onGetProductGendersRequest(
    GetProductGendersRequest event,
    Emitter<GetProductGendersState> emit,
  ) async {
    emit(GetProductGendersLoading());

    var genders = await repository.getProductGenders(event.clubId);

    emit(GetProductGendersCompleted(genders));
  }
}
