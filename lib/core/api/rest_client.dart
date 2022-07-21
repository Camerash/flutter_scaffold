import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

// TODO: Update APIs
// This url will be ignored if baseUrl is passed
@RestApi(baseUrl: "https://api.example.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/login")
  Future<dynamic> login();
}
