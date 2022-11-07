part of 'episode_bloc.dart';

@immutable
abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoadingState extends EpisodeState {}

class EpisodeFetchedState extends EpisodeState {
  final List<EpisodeModel> episodeModelList;

  EpisodeFetchedState(this.episodeModelList);
}

class LocationErrorState extends EpisodeState {
  final CatchException error;

  LocationErrorState({required this.error});
}
