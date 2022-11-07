import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lesson49/helpers/api_requester.dart';
import 'package:lesson49/helpers/catch_exception.dart';
import 'package:lesson49/models/episode_model.dart';
import 'package:lesson49/models/person_model.dart';

class PersonProvider {
  ApiRequester apiRequester = ApiRequester();

  Future<List<PersonModel>> getPerson() async {
    try {
      Response response = await apiRequester.toGet('character');
      print("response ==== ${response}");

      if (response.statusCode == 200) {
        return response.data['results']
            .map<PersonModel>((e) => PersonModel.fromJson(e))
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
