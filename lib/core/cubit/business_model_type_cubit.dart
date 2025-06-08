import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class BusinessModelTypeCubit extends Cubit<BusinessModelTypeGetState> {
  final StorageManager storageManager;

  BusinessModelTypeCubit(this.storageManager)
    : super(BusinessModelTypeGetLoading());

  // when player want see club type, this method will be triggered
  void getBusinessModelTypeRequest() async {
    try {
      int response = await storageManager.getInt('business_model_type') ?? 0;
      emit(BusinessModelTypeGetSuccess(response));
    } catch (e) {
      emit(BusinessModelTypeGetError(e.toString()));
    }
  }

  // when player want select club type, this method will be triggered
  void selectBusinessModelTypeRequest({required int clubType}) async {
    await storageManager.setInt('business_model_type', clubType);
  }
}

sealed class BusinessModelTypeGetState extends Equatable {
  const BusinessModelTypeGetState();
}

// loading status
class BusinessModelTypeGetLoading extends BusinessModelTypeGetState {
  @override
  List<Object> get props => [];
}

// success status
class BusinessModelTypeGetSuccess extends BusinessModelTypeGetState {
  final int? clubType;
  const BusinessModelTypeGetSuccess(this.clubType);

  @override
  List<Object?> get props => [clubType];
}

// error status
class BusinessModelTypeGetError extends BusinessModelTypeGetState {
  final String errorMsg;
  const BusinessModelTypeGetError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
