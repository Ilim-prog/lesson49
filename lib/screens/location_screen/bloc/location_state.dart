part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationFetchedState extends LocationState {
  final List<LocationModel> locationModelList;

  LocationFetchedState(this.locationModelList);
}

class LocationErrorState extends LocationState {
  final CatchException error;

  LocationErrorState({required this.error});
}
