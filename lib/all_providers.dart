import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_manager.dart';
import 'model/counter_model.dart';

final titleProvider = Provider<String>((ref) => 'Riverpod Basics');
final titleProvider2 = Provider<String>((ref) => 'Riverpod StateNotifierUsage');

final textProvider = Provider<String>((ref) {
  return 'Butona basılma sayısı';
});

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

//1. parametre yeni CounterManager iş kodlarını, metotların olduğu dosyadır.
//Buna erişmek için ref.watch(counterNotifierProvider.notifier) demek gerekir.

//2. parametre yani CounterModel ise bu providerin state'idir.
//Buna erişmek için ref.watch(counterNotifierProvider) demek gerekir.
//CounterModel sınıfındaki counter değeri için
//var counterValue = ref.watch(counterNotifierProvider).counterValue
final counterNotifierProvider =
    StateNotifierProvider<CounterManager, CounterModel>((ref) {
  return CounterManager();
});

final isCoupleProvider = Provider<bool>((ref) {
  var counterModel = ref.watch(counterNotifierProvider);

  // if (counterModel.counterValue % 2 == 0) {
  //   return true;
  // }
  // return false;

  return counterModel.counterValue % 5 == 0 ? true : false;
});
