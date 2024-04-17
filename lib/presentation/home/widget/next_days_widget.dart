import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullstacktask/app/theme/colors.dart';

class NextDaysWeatherWidget extends StatelessWidget {
  const NextDaysWeatherWidget({super.key, this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
                                      height: 170.h,
                                      width: 200.w,
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(20.r),
                                        gradient: AppColor.gradient
                                      ),
                                      child: Column(
                                        children: [
                                          Text(data.datetime??"",
                                          style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700
                                          ),),
                                          Text("${data.temp.toString()}°C"),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("min: ${data.feelslikemin.toString()}°C"),
                                              Text("max: ${data.feelslikemax.toString()}°C"),
                                            ],
                                          ),
                                          Text("humidity: ${data.humidity.toString()}"),
                                          Text("wind Speed: ${data.windspeed.toString()}"),
                                          
                                        ],
                                      ),
                                    );
  }
}