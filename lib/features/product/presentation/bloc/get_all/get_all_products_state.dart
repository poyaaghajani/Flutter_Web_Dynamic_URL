part of 'get_all_products_bloc.dart';

abstract class GetAllProductsState extends Equatable {
  const GetAllProductsState();
}

// loading state
class GetAllProductsLoading extends GetAllProductsState {
  @override
  List<Object> get props => [];
}

// completed state
class GetAllProductsCompleted extends GetAllProductsState {
  final Either<String, List<AllProductsModel>> response;
  const GetAllProductsCompleted(this.response);

  @override
  List<Object> get props => [response];
}
