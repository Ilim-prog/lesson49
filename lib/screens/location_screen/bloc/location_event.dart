part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class GetlocationEvent extends LocationEvent {}

class GetLocationsEvent extends LocationEvent {}
