import 'package:mobx/mobx.dart';

import 'models/person_model.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  PersonModel person = PersonModel(firstName: '', lastName: '');

  @observable
  int counter = 0;

  @observable
  String firstName = '';
  @observable
  String lastName = '';
  @computed
  String get fullName => '$firstName $lastName'.trim();
  @observable
  ObservableList<PersonModel> listNames = <PersonModel>[].asObservable();

  @action
  void addName(PersonModel name) {
    listNames.add(name);
  }

  @action
  void setList(List<PersonModel> names) {
    listNames = names.asObservable();
  }

  @action
  void increment() {
    counter++;
  }

  @action
  void decrement() {
    counter--;
  }

  @action
  void setFirstName(String value) => firstName = value;
  @action
  void setLastName(String value) => lastName = value;

  @action
  void setPersonFirstName(String value) => person = person.copyWith(firstName: value);
  @action
  void setPersonLastName(String value) => person = person.copyWith(lastName: value);
}
