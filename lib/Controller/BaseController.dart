import 'package:dio/dio.dart';
import 'package:hay_project/ignore.dart';

class BaseController {
  Dio dio = new Dio();
  final String baseUrl = serverUrl;
}
