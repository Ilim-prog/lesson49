import 'package:lesson49/models/episode_model.dart';
import 'package:lesson49/screens/episode_screen/bloc/episode_provider.dart';

class EpisodeRepository {
  EpisodeProvider provider = EpisodeProvider();

  Future<List<EpisodeModel>> getAllUsers() {
    return provider.getPerson();
  }
}
