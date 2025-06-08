part of 'get_genders_bloc.dart';

abstract class GetProductGendersState extends Equatable {
  const GetProductGendersState();
}

// loading state
class GetProductGendersLoading extends GetProductGendersState {
  @override
  List<Object?> get props => [];
}

// completed state
class GetProductGendersCompleted extends GetProductGendersState {
  final Either<String, ProductGenderModel> genders;
  const GetProductGendersCompleted(this.genders);

  @override
  List<Object?> get props => [genders];
}
