import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/model/counter_model.dart';

class CounterManager extends StateNotifier<CounterModel> {
  CounterManager() : super(CounterModel(0));

  void increase() {
    var currentCounterValue = state.counterValue;
    state = CounterModel(currentCounterValue+1);
  }

  void decrease() {
    var currentCounterValue = state.counterValue;
    state = CounterModel(currentCounterValue-1);
  }
}
