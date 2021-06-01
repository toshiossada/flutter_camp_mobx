import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import 'home_store.dart';
import 'models/person_model.dart';

class HomeController {
  final txtFirstName = TextEditingController();
  final txtLastName = TextEditingController();
  final _store = HomeStore();
  int get counter => _store.counter;
  PersonModel get person => _store.person;
  String get fullName => _store.fullName;
  List<PersonModel> get listNames => _store.listNames;

  String operator = '+';

  HomeController() {
    autorun((_) {
      print(counter);
    });

    when((_) {
      return counter != 0 && counter % 2 == 0;
    }, () {
      print('Número par');
    });

    // reaction<bool>((_) {
    //   return counter % 6 == 0;
    // }, (value) {
    //   if (value) print('Multiplo de 6');
    // });
    reaction<String>((_) {
      return '$fullName';
    }, (value) {
      print('Nome Completo: $value');
    });

    initNames();
  }

  Future<void> initNames() async {
    await Future.delayed(Duration(seconds: 3));
    var list = List.generate(
        10,
        (index) => PersonModel(
              firstName: 'Nome $index',
              lastName: '',
            ));
    _store.setList(list);
  }

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

  void setFirstName(String value) => _store.setPersonFirstName(value);
  void setLastName(String value) => _store.setPersonLastName(value);

  void addPerson() {
    if (_store.person.firstName.isNotEmpty && _store.person.lastName.isNotEmpty)
      _store.addName(_store.person);
    _store.setPersonLastName('');
    _store.setPersonFirstName('');
    txtFirstName.clear();
    txtLastName.clear();
  }
}
