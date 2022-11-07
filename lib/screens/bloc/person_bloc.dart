// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson49/helpers/catch_exception.dart';
import 'package:lesson49/models/episode_model.dart';
import 'package:lesson49/models/person_model.dart';
import 'package:lesson49/screens/bloc/person_repository.dart';
import 'package:meta/meta.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonInitial()) {
    PersonRepository repository = PersonRepository();

    on<PersonEvent>((event, emit) async {
      emit(PersonLoadingState());
      try {
        List<PersonModel> personModelList = await repository.getAllUsers();

        emit(PersonFetchedState(personModelList));
      } catch (e) {
        emit(PersonErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
