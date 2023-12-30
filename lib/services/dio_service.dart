import 'dart:developer';
import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    return await dio
        .get(url,
        options: Options(method: 'GET', responseType: ResponseType.json))
        .then((response) {
      log(response.toString());
      return response;
    }).catchError((err){
      if(err is DioException)
      {
        return err.response!;
      }
    });
  }
}
