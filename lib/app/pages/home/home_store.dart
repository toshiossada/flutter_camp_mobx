import 'package:mobx/mobx.dart';

class HomeStore {
  var counter = Observable<int>(0);

  late var increment = Action(_increment);
  late var decrement = Action(_decrement);

  void _increment() {
    counter.value++;
  }
  void _decrement() {
    counter.value--;
  }
}
