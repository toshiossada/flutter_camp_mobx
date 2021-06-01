import 'home_store.dart';

class HomeController {
  final _store = HomeStore();
  int get counter => _store.counter.value;

  String operator = '+';

  void incrementCounter() {
    if (operator == '+') {
      _store.increment();
    } else {
      _store.decrement();
    }

    if (counter == 10) {
      operator = '-';
    } else if (counter == 0) {
      operator = '+';
    }
  }
}
