import 'package:dio/dio.dart';

class DioHelper {
  // Create Object From Dio
  static late Dio dio;

  // Initial Value For Dio
  static init() {
    dio = Dio(
        // Here Base Url
        BaseOptions(
          // Mohamed Khaled Base Url Api
          // http://occasion-smart-system.atwebpages.com/loginandregister/loginandregister/public/api/
          // Content-Type = 'multipart/form-data; boundary=<calculated when request is sent>'

            baseUrl: 'http://occasion-smart-system.atwebpages.com/loginandregister/loginandregister/public/api/',
            receiveDataWhenStatusError: true,
            headers: {'Content-Type': 'application/json'}));
  }

  //Function For Get Data
  static Future<Response> getData(
      {
        required String url,
        Map<String, dynamic>? query
      }) async {
    return await dio.get(url, queryParameters: query);
  }



  // Function For Pst Data
  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    return dio.post(
      url,
      queryParameters: query,
      data: data
    );
  }
}
