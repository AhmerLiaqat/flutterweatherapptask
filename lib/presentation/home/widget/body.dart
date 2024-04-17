import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullstacktask/app/theme/colors.dart';
import 'package:fullstacktask/controller/home_controller.dart';
import 'package:fullstacktask/data/api/config.dart';
import 'package:fullstacktask/model/weather_model.dart';
import 'package:fullstacktask/presentation/common/apptextfield.dart';
import 'package:fullstacktask/presentation/home/widget/next_days_widget.dart';
import 'package:fullstacktask/presentation/home/widget/searchtextfield.dart';
import 'package:fullstacktask/presentation/home/widget/suggestion_widget.dart';
import 'package:fullstacktask/utils/appstring.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: Obx(()=>
      Get.find<HomeController>().lat.value==0.0?const Center(child: CircularProgressIndicator()):
         FutureBuilder(   
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // if data has errors
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error.toString()} occurred',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                );
        
                // if data has no errors
              } else if (snapshot.hasData) {
                // Extracting data from snapshot object
                final data = snapshot.data as WeatherModel;
                return Container(
                  padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: AppColor.backgroundColor
                    
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: SafeArea(
                    child: Column(
                      children: [
                       const SearchTextField(),
                        SizedBox(height: 10.h,),
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.r),
                              
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("CURRENT WEATHER : ${data.currentConditions?.datetime??""}",
                                  style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24.sp,
                                  color: AppColor.blackColor),),
                                  SizedBox(height: 10.h,),
                                  Obx(()=>
                                   Text(
                                        Get.find<HomeController>().area.value,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20.sp,
                                                                    color: AppColor.blackColor),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: AppColor.whiteColor,
                                      ),
                                      Text(data.address??""),
                                    ],
                                  ),
                                  SizedBox(height: 10.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(data.currentConditions?.conditions??""),
                                      Text(data.currentConditions?.icon??""),
                                    ],
                                  ),
                                   
                                            //                  CachedNetworkImage(
                                            //   fit: BoxFit.cover,
                                            //   imageUrl:"$imageURL${data.weather![0].icon!}.png",
                                                  
                                            //   placeholder: (context, url) =>
                                            //       const Center(child: CircularProgressIndicator()),
                                            //   errorWidget: (context, url, error) =>const Icon(Icons.error),
                                            // ),
                                        
                                  SizedBox(height: 10.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("humidity: ${ data.currentConditions!.humidity.toString()}"
                                      ),
                                      Text(
                                    "${data.currentConditions?.temp??""}°C",
                                  ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h,),
                                  Text("wind speed: ${data.currentConditions?.windspeed??""}"),
                                  SizedBox(height: 10.h,),
                                  Text(data.description??"",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20.sp,
                                  color: AppColor.blackColor),),
                                  Divider(color: AppColor.blackColor,),
                                  Text("Next Five Days".toUpperCase(),style: TextStyle(fontSize: 26.sp,fontWeight: FontWeight.w800),), 
                                ],
                              ),
                            ),
                            Obx(
                              ()=> Get.find<HomeController>().showAutoSearch.value==false?Container():
                              const SuggestionWidget()
                               ),
                      
                          ],
                        ),
                        Expanded(
                                child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (context,index) {
                                    return NextDaysWeatherWidget(data: data.days![index],);
                                  }
                                ),
                              )
                      ],
                    ),
                  ),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Text("State ${snapshot.connectionState}"),
              );
            }
            return const Center(
              child: Text("Server timed out!"),
            );
          },
          future: Get.find<HomeController>().getWeatherData(Get.find<HomeController>().lat.value.toString(), Get.find<HomeController>().lon.value.toString()),
        ),
      ),
    );
  }
}