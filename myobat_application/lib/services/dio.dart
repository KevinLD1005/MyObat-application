import 'package:dio/dio.dart';

// const baseUrl = "http://localhost:8080/myobat-api/public/api";

Dio dio() {
  Dio dio = Dio();

  //ios
  //dio.options.baseUrl = 'http:localhost:8000/api';

  //android
  // dio.options.baseUrl = 'http://10.0.2.2:8000/api';
  dio.options.baseUrl = 'http://ec2-100-28-205-231.compute-1.amazonaws.com/api';

  dio.options.headers['accept'] = 'application/json';

  return dio;
}
