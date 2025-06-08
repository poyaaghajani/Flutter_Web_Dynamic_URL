import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingActionButtonCubit extends Cubit<double> {
  FloatingActionButtonCubit() : super(1.0);

  void setScale(double value) {
    emit(value);
  }
}
