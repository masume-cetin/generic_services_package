import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSliderCubit extends Cubit<int> {
  Timer? _timer;
  TimerSliderCubit() : super(0);

  void setSliderTab(int seconds, int indexCount) {
    _timer?.cancel(); // just in case
    int index = 0;
    _timer = Timer.periodic(Duration(seconds: seconds), (timer) {
      emit(index);
      index++;
      if (index >= indexCount) {
        index = 0;
      }
    });
  }
  Future<void> closeSlider() {
    _timer?.cancel(); // clean up when widget is removed
    return super.close();
  }
}
