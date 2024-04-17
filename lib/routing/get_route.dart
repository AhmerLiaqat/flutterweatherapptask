


import 'package:flutter/material.dart';
import 'package:fullstacktask/presentation/home/home.dart';
import 'package:fullstacktask/routing/routes.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
       ///[Home]
 case AppRoutes.home:
        return PageTransition(
          child:const  HomeView(),
         type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 2),
          childCurrent:const HomeView(),
          settings: settings,
        );
     

       default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        ),
      );
    });
  }
}
