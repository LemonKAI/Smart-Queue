

import 'package:flutter/material.dart';
import 'package:queuing/pages/input.dart';
import 'pages/info.dart';
import 'pages/home.dart';
import 'pages/RestaurantPage.dart';
import 'pages/CartPage.dart';
import 'pages/splash.dart';
void main(){
  

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Pacifico',
    ),
    initialRoute: '/input',
    routes:{
      '/info' : (context) => Info(),
      '/home' : (context) => Home(),
      '/rest' : (context) => RestaurantPage(),
      '/cartpage' : (context) => CartPage(),
      '/splash' : (context) => SplashScreen(),
      '/input' : (context) => InputInfo(),
    },
    )
  );
}