import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fullstacktask/app/theme/colors.dart';
import 'package:fullstacktask/routing/get_route.dart';
import 'package:fullstacktask/routing/routes.dart';
import 'package:get/get.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {

     var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColor.lightblue,
        statusBarColor: AppColor.lightblue,
        systemNavigationBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
     return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(414, 891),
        builder: (context, child) {
          return 
             GetMaterialApp(
              title: "Inspo",
              builder: FToastBuilder(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              initialRoute: AppRoutes.home,
              
            );
        });
  }
}