import 'package:bloc/bloc.dart';
import 'package:lesson49/helpers/catch_exception.dart';
import 'package:lesson49/models/episode_model.dart';
import 'package:lesson49/screens/episode_screen/bloc/episode_repository.dart';
import 'package:meta/meta.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc() : super(EpisodeInitial()) {
    EpisodeRepository repository = EpisodeRepository();

    on<EpisodeEvent>((event, emit) async {
      emit(EpisodeLoadingState());
      try {
        List<EpisodeModel> episodeModelList = await repository.getAllUsers();

        emit(EpisodeFetchedState(episodeModelList));
      } catch (e) {
        emit(LocationErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
