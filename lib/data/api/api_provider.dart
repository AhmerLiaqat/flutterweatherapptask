// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'api_exceptions.dart';
import 'config.dart';


class ApiProvider extends GetxService {
  ///SessionManager sessionManager = Get.find<SessionManager>();

  Future<http.Response> getRequest(String? endPoint,
      {String? baseURLCustom,String? token}) async {
    try {
      String url = '${baseURLCustom ?? baseURL}$endPoint';
      log('[GET] $url');
      http.Response response = await http
          .get(
        Uri.parse(url),
         headers:token!=null && token!=""?
         {
                    'Content-Type': 'application/json',
                    'Accept': '*/*',
                    "authorization":
                        token
                  }:
        {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      )
          .timeout(
        const Duration(seconds: timeoutDuration),
        onTimeout: (() => throw "Check Your Internet & try again"),
      );
            
      return response;
      // return response;
    } catch (e) {
      log(e.toString()); 
      throw e.toString();
    }
  }

  Future<http.Response> postRequest(String endPoint, {dynamic body}) async {
    //SessionManager _s=SessionManager();
    try {
      String url = "$baseURL$endPoint";
      log('API URL: POST $url  $body');
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body:jsonEncode(body),
      ).timeout(
        const Duration(seconds: timeoutDuration),
        onTimeout: (() => throw "Check Your Internet & try again"),
      );
      log('Response: ${response.statusCode} $url');
      return response;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }

  Future<http.Response> pushNotificationPostRequest(String endPoint, {dynamic body}) async {
    //SessionManager _s=SessionManager();
    try {
      String url = endPoint;
      log('API URL: POST $url  $body');
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          'Authorization': 'key=AAAA7Rt02hU:APA91bHx6VMNo4hciM-eP4w4U5hLee47VrIK-YHemtecZgOaEdJQONRrQmsGj2KjtbSfdu4oWMcIXDERiZxtabhxUmNwkSQeM8kKrNuTU_27wu8gPZgWeNWvFQlAz5aRU5kknO2GdQzX',
        },
        body:jsonEncode(body),
      ).timeout(
        const Duration(seconds: timeoutDuration),
        onTimeout: (() => throw "Check Your Internet & try again"),
      );
      log('Response: ${response.statusCode} $url');
      return response;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }


  Future<http.Response> putRequest(String endPoint, {dynamic body}) async {
    //SessionManager _s=SessionManager();
    try {
      String url = "$baseURL$endPoint";
      log('API URL: POST $url  $body');
      http.Response response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body:jsonEncode(body),
      ).timeout(
        const Duration(seconds: timeoutDuration),
        onTimeout: (() => throw "Check Your Internet & try again"),
      );
      log('Response: ${response.statusCode} $url');
      return response;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
  
  Future<http.Response> patchRequest(String endPoint, {dynamic body}) async {
    //SessionManager _s=SessionManager();
    try {
      String url = "$baseURL$endPoint";
      log('API URL: PATCH $url  $body');
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body:jsonEncode(body),
      ).timeout(
        const Duration(seconds: timeoutDuration),
        onTimeout: (() => throw "Check Your Internet & try again"),
      );
      log('Response: ${response.statusCode} $url');
      return response;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
  
  Future<http.Response> deleteRequest(String? endPoint,
      {String? baseURLCustom,String? token}) async {
    try {
      String url = '${baseURLCustom ?? baseURL}$endPoint';
      log('[DELETE] $url');
      http.Response response = await http
          .delete(
        Uri.parse(url),
         headers:token!=null && token!=""?
         {
                    'Content-Type': 'application/json',
                    'Accept': '*/*',
                    "authorization":
                        token
                  }:
        {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      )
          .timeout(
        const Duration(seconds: timeoutDuration),
        onTimeout: (() => throw "Check Your Internet & try again"),
      );
            
      return makeResponse(response);
      // return response;
    } catch (e) {
      log(e.toString()); 
      throw e.toString();
    }
  }

  // Future<http.Response> postRequest(String endPoint, {dynamic body}) async {
  //   try {
  //     String url = "$baseURL$endPoint";
  //    // log('POST $url  $body ${sessionManager.getBearerToken()}');
  //     http.Response response = await http
  //         .post(
  //           Uri.parse(url),
  //           //headers:
  //           // endPoint == APIURLS.deleteAccount
  //           //     ? {
  //           //         'Accept': '*/*',
  //           //         'authorization': '${sessionManager.getBearerToken()}',
  //           //       }
  //           //     : sessionManager.isUserLogin
  //           //         ? {
  //           //             'Content-Type': 'application/json',
  //           //             'Accept': '*/*',
  //           //             'authorization': '${sessionManager.getBearerToken()}',
  //           //           }
  //           //         :
  //           //{
  //             headers: <String, String>{
  //               'Content-Type': 'application/json; charset=UTF-8',
  //               "Accept": "application/json",
  //             //},
  //                     },
  //           body: jsonEncode(body),
  //         )
  //         .timeout(
  //            Duration(seconds: timeoutDuration),
  //           onTimeout: (() => throw "Please try again"),
  //         );
  //     log('Response: ${response.statusCode} $url');
  //     return makeResponse(response);
  //     // return response;
  //   } catch (e) {
  //     log(e.toString());
  //     throw 'Please try again';
  //   }
  // }

  // Future<http.Response> postRequest1(String endPoint, {dynamic body}) async {
  //   try {
  //     String url = "$baseURL$endPoint";
  //     //log('POST $url  $body ${sessionManager.getBearerToken()}');
  //     http.Response response = await http
  //         .post(
  //           Uri.parse(url),
  //          // headers:
  //           // endPoint == APIURLS.deleteAccount
  //           //     ? {
  //           //         'Accept': '*/*',
  //           //         'authorization': '${sessionManager.getBearerToken()}',
  //           //       }
  //           //     : sessionManager.isUserLogin
  //           //         ? {
  //           //             'Content-Type': 'application/json',
  //           //             'Accept': '*/*',
  //           //             'authorization': '${sessionManager.getBearerToken()}',
  //           //           }
  //           //         :
  //           //{
  //             headers: <String, String>{
  //               'Content-Type': 'application/json; charset=UTF-8',
  //               "Accept": "application/json",
  //               //},
  //             //},
  //                     },
  //           body: jsonEncode(body),
  //         )
  //         .timeout(
  //           const Duration(seconds: timeoutDuration),
  //           onTimeout: (() => throw 'Please try again'),
  //         );
  //     log('Response: ${response.statusCode} $url');
  //     return response;
  //   } catch (e) {
  //     log(e.toString());
  //     throw 'Please try again';
  //   }
  // }

  dynamic makeResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
      case 208:
      case 422:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        {
          //sessionManager.clearSession();
          // if (Get.isRegistered<MyAccountController>()) {
          //   Get.find<MyAccountController>().isUserLoggedIn.value = false;
          // } else {
          //   Get.put(MyAccountController()).isUserLoggedIn.value = false;
          // }
          // if (Get.isRegistered<HomeController>()) {
          //   Get.delete<HomeController>(force: true);
          // }
          // Get.offAllNamed(AppRoutes.LOGIN);
          throw UnauthorisedException(response.body.toString());
        }
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
