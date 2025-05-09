import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSliderCubit extends Cubit<int> {
  Timer? _timer;
  bool _isClosed = false;

  TimerSliderCubit() : super(0);

  void setSliderTab(int seconds, int indexCount) {
    _timer?.cancel(); // cancel any previous timer

    int index = 0;
    _timer = Timer.periodic(Duration(seconds: seconds), (timer) {
      if (_isClosed) return; // prevent emit after close
      emit(index);
      index = (index + 1) % indexCount; // clean looping
    });
  }

  @override
  Future<void> close() {
    _isClosed = true;
    _timer?.cancel();
    return super.close();
  }
}
