import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/hotels_response.dart';

part 'home_api_client.g.dart';

@RestApi()
abstract class HomeApiClient {
  factory HomeApiClient(Dio dio, {String baseUrl}) = _HomeApiClient;

  @GET("/hotels.json")
  Future<HotelsResponse> fetchHotelsData();
}
