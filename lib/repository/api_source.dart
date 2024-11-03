import 'package:dio/dio.dart';
import 'package:frontend/const/data.dart';
import 'package:frontend/model/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_source.g.dart';

@RestApi(baseUrl: "http://$ip")
abstract class ApiSource {
  factory ApiSource(Dio dio, {String baseUrl}) = _ApiSource;

  @GET("/mainpage")
  Future<ApiResponse> getMainSource();

  @POST("/mwohae")
  Future<ApiResponse> postMwohae();

  @GET("/hellos/detail/{id}")
  Future<ApiResponse> getDetail({
    @Path() required int id,
  });

  @POST("/hellos")
  @MultiPart()
  Future<ApiResponse> postHello({
    @Part() required String helloDTO,
    @Part() required String files,
  });

  @GET("/records/users/{id}")
  Future<ApiResponse> getHelloList({
    @Path() required int id,
});

  @POST("/messages")
  Future<ApiResponse> sendMessage();
}
