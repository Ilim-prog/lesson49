part of 'person_bloc.dart';

@immutable
abstract class PersonState {}

class PersonInitial extends PersonState {}

class PersonLoadingState extends PersonState {}

class PersonFetchedState extends PersonState {
  final List<PersonModel> personModelList;

  PersonFetchedState(this.personModelList);
}

class PersonErrorState extends PersonState {
  final CatchException error;

  PersonErrorState({required this.error});
}
