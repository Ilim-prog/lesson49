import 'package:dio/dio.dart';
import 'package:lesson49/helpers/api_requester.dart';
import 'package:lesson49/helpers/catch_exception.dart';
import 'package:lesson49/models/location_model.dart';

class LocationProvider {
  ApiRequester apiRequester = ApiRequester();

  Future<List<LocationModel>> getPerson() async {
    try {
      Response response = await apiRequester.toGet('location');
      print("response ==== ${response}");

      if (response.statusCode == 200) {
        return response.data['results']
            .map<LocationModel>((e) => LocationModel.fromJson(e))
            .toList();

        // PersonModel personModel = PersonModel.fromJson(response.data);
        // print("personModel === $personModel");
      }

      throw CatchException.convertException(response);
    } catch (e) {
      print('e======$e');
      throw CatchException.convertException(e);
    }
  }
}
