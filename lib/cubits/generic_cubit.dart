import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_services_package/cubits/states/generic_states.dart';

class ApiCubit<T> extends Cubit<ApiState<T>> {
  ApiCubit() : super(ApiInitial());

  void reset() => emit(ApiInitial());

  Future<void> request(Future<T> Function() apiCall) async {
    emit(ApiLoading());
    try {
      final response = await apiCall();
      emit(ApiSuccess(response));
    } catch (e) {
      emit(ApiError(e.toString()));
    }
  }
}

