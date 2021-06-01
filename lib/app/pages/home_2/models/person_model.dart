import 'package:flutter/material.dart';

@immutable
class PersonModel {
  final String firstName;
  final String lastName;


  PersonModel({
    required this.firstName,
    required this.lastName,
  });

  

  PersonModel copyWith({
    String? firstName,
    String? lastName,
  }) {
    return PersonModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}
