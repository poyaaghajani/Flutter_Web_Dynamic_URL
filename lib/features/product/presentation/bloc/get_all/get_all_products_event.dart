part of 'get_all_products_bloc.dart';

abstract class GetAllProductsEvent extends Equatable {
  const GetAllProductsEvent();
}

// get all products request
class GetAllProductsRequest extends GetAllProductsEvent {
  final int clubId;
  const GetAllProductsRequest({required this.clubId});

  @override
  List<Object> get props => [clubId];
}
