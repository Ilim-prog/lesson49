import 'package:lesson49/models/location_model.dart';
import 'package:lesson49/screens/location_screen/bloc/location_provider.dart';

class LocationRepository {
  LocationProvider provider = LocationProvider();

  Future<List<LocationModel>> getAllUsers() {
    return provider.getPerson();
  }
}
