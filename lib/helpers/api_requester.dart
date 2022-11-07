import 'package:dio/dio.dart';
import 'package:lesson49/helpers/catch_exception.dart';

class ApiRequester {
  static String url = "https://rickandmortyapi.com/api/";

  Dio initDio() {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 10000,
        connectTimeout: 10000,
      ),
    );
  }

  Future<Response> toGet(String url) async {
    Dio dio = initDio();
    try {
      return dio.get(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
