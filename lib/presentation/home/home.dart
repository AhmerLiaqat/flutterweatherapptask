import 'package:flutter/material.dart';
import 'package:fullstacktask/controller/home_controller.dart';
import 'package:fullstacktask/presentation/home/widget/body.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return const Scaffold(
      body: SafeArea(child: HomeBody()),
    );
  }
}