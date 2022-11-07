import 'package:bloc/bloc.dart';
import 'package:lesson49/helpers/catch_exception.dart';
import 'package:lesson49/models/location_model.dart';
import 'package:lesson49/screens/location_screen/bloc/location_repositort.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    LocationRepository repository = LocationRepository();

    on<LocationEvent>((event, emit) async {
      emit(LocationLoadingState());
      try {
        List<LocationModel> locationModelList = await repository.getAllUsers();

        emit(LocationFetchedState(locationModelList));
      } catch (e) {
        emit(LocationErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
