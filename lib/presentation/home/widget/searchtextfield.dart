import 'package:flutter/material.dart';
import 'package:fullstacktask/app/theme/colors.dart';
import 'package:fullstacktask/controller/home_controller.dart';
import 'package:fullstacktask/presentation/common/apptextfield.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppTextField(
                          controller: Get.find<HomeController>().addressController,
                          hint: "Search Location",
                          fillColor: AppColor.whiteColor,
                          borderColor: AppColor.blackColor,
                          prefixIcon: Icon(Icons.search),
                          onFieldSubmitted: (p0) {
                            Get.find<HomeController>().showAutoSearch.value=false;
                          },
                          onChanged: (v){
                            Get.find<HomeController>().getSuggession(v);
                            if(v.isEmpty){
                              Get.find<HomeController>().showAutoSearch.value=false;
                            }
                          },
                        );
                      
  }
}