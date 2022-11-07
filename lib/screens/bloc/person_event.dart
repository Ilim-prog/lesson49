part of 'person_bloc.dart';

@immutable
abstract class PersonEvent {}

class GetPersonEvent extends PersonEvent {}

class GetPersonsEvent extends PersonEvent {}
