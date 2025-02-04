import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/features/home/data/repository/home_repository.dart';

import '../../../../core/exception/network_exception.dart';
import '../../../../core/helpers/app_config.dart';
import '../../../../core/helpers/log_utils.dart';
import '../../../../l10n/app_localizations.dart';
import '../api/home_api_client.dart';
import '../models/hotels_response.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeApiClient apiClient = HomeApiClient(Dio(), baseUrl: AppConfig.instance.baseApiUrl());

  @override
  Future<HotelsResponse> fetchHotelsData() async {
    HotelsResponse response;
    try {
      response = await apiClient.fetchHotelsData();
      LogUtils.logWith('fetchHotelsData:', response.toJson());
    } on DioException catch (e) {
      NetworkException errorResponse = NetworkException(
        statusCode: e.response?.statusCode,
        statusMessage: e.response?.statusMessage,
        error: e.error,
        path: "hotels.json",
      );
      LogUtils.printLog(errorResponse.toJson());
      throw errorResponse;
    } catch (e) {
      LogUtils.printLog(e.toString());
      LogUtils.printLog(e);
      throw NetworkException(
        statusMessage: AppLocalizations.of(Get.context!)!.failureTitle,
        path: "hotels.json",
      );
    }
    return response;
  }
}
