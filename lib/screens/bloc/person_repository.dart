import 'package:lesson49/models/episode_model.dart';
import 'package:lesson49/models/person_model.dart';
import 'package:lesson49/screens/bloc/person_provider.dart';

class PersonRepository {
  PersonProvider provider = PersonProvider();

  Future<List<PersonModel>> getAllUsers() {
    return provider.getPerson();
  }

  // Future<PersonModel> getUser(int id) {
  //   return provider.getUser(id);
  // }
}
