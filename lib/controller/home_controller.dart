import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fullstacktask/data/repository/home_repo.dart';
import 'package:fullstacktask/model/weather_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{
  HomeRepository homeRepository=HomeRepository();
   Rx<double> lat=0.0.obs;
   Rx<double> lon=0.0.obs;
   var isLoading=false.obs;
   var showAutoSearch=false.obs;
   Rx<List<dynamic>> placesList=Rx<List<dynamic>>([]);
  String apiKey="AIzaSyDNpfQSpyR2QvDDHHQwyRuxUvStmPnzF0c";
  var uuid=const Uuid();
   Rx<WeatherModel> weather=WeatherModel().obs;
   var area="".obs;
   TextEditingController addressController=TextEditingController();

@override
  void onInit() {
    // TODO: implement onInit
    getcurrentlocation();
    super.onInit();
  }

///[GetCurrentLocation]
  void getcurrentlocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission != LocationPermission.denied) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat.value = position.latitude;
      lon.value = position.longitude;
      getWeatherData(lat.value.toString(), lon.value.toString());
    }
  }

///[GetWeatherData]
   Future<WeatherModel> getWeatherData(String lat,String lon) async {
    try {
      isLoading.value=true;
      var response = await homeRepository.getWeatherData(lat:lat,lon:lon );
      if (response.queryCost == 1) {
        weather.value=response;
        getAddressWithLatLon(double.parse(lat), double.parse(lon));
        print("data:${weather.value.address}");
      }
      return weather.value;
    } catch (e) {
      throw e;
     
    }finally{
      isLoading.value=false;
    }
  }

///[getSuggession]
  void getSuggession(String input)async{
    String sessionToken=uuid.v4();
    
    String baseUrl="https://maps.googleapis.com/maps/api/place/autocomplete/json";
    
    String request="$baseUrl?input=$input&components=country:PK&key=$apiKey&sessionToken=$sessionToken";
    try{
      var response=await http.get(Uri.parse(request));
      if(response.statusCode==200){
            showAutoSearch.value=true;
            placesList.value=jsonDecode(response.body.toString())['predictions'];
      }
      print(response.body);
    }catch(e){
      print(e);
    }
   }
   

  ///[GetAddressWithLatLOn]
getAddressWithLatLon(double lat,double lon) async {
   List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
   print(placemarks[0].subAdministrativeArea);
   area.value="${placemarks[0].subLocality.toString()}, ${placemarks[0].subAdministrativeArea.toString()},${placemarks[0].administrativeArea.toString()} ";
   
  }

}