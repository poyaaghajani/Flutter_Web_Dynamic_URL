import 'package:bloc/bloc.dart';

enum DropdownStatus { open, closed }

class DropdownCubit extends Cubit<DropdownStatus> {
  DropdownCubit() : super(DropdownStatus.closed);

  void toggleDropdown() {
    emit(
      state == DropdownStatus.open
          ? DropdownStatus.closed
          : DropdownStatus.open,
    );
  }
}
