import 'package:dio/dio.dart';
import 'package:frontend/const/data.dart';
import 'package:retrofit/retrofit.dart';

part 'api_source.g.dart';

@RestApi(baseUrl: "http://$ip")
abstract class ApiSource {
  factory ApiSource(Dio dio, {String baseUrl}) = _ApiSource;
}