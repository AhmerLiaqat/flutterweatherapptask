import 'dart:convert';

import 'package:fullstacktask/data/api/api_provider.dart';
import 'package:fullstacktask/data/api/config.dart';
import 'package:fullstacktask/model/weather_model.dart';
import 'package:fullstacktask/utils/appstring.dart';
import 'package:get/get.dart';

class HomeRepository extends GetxService{
  ApiProvider apiProvider=ApiProvider();

  ///[GetWeatherData]
   Future<WeatherModel> getWeatherData({required String  lat,required String lon}) async {
    var response = await apiProvider.getRequest("$lat,$lon?key=${AppString.apiKey}",);
    if (response.statusCode == 200 || response.statusCode==201) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw 'Failed to Get Data';
    }
  }

}