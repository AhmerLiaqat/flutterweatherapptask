import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullstacktask/app/theme/colors.dart';
import 'package:fullstacktask/controller/home_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                              height: 200.h,
                                  color: AppColor.lightblue,
                                //height: 200.h,
                                child: ListView.builder(
                                  itemCount: Get.find<HomeController>().placesList.value.length,
                                  itemBuilder: (context,index){
                                     return Padding(padding: EdgeInsets.all(8.r),
                                                         child: InkWell(
                                                         onTap: ()async{
                              Get.find<HomeController>().addressController.text=Get.find<HomeController>().placesList.value[index]["description"];
                               List<Location> location=await locationFromAddress(Get.find<HomeController>().placesList.value[index]["description"]);
                                Get.find<HomeController>().lat.value=location.first.latitude;
                                Get.find<HomeController>().lon.value=location.first.longitude;      
                                Get.find<HomeController>().showAutoSearch.value=false;
                                                        },
                                                    child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35.h,
                                      width: 35.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.whiteColor
                                      ),
                                      child: Icon(Icons.location_on,size: 18.sp,color: AppColor.blackColor,)),
                                    SizedBox(width: 20.w,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(Get.find<HomeController>().placesList.value[index]["description"],
                                          style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 8.h,),
                                Divider(color: AppColor.whiteColor),
                              ],
                                                   ),
                                                 ),
                                                 );
                                                }));                          
  }
}