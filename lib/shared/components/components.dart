import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';


void navigateAndFinish(context , widget) {
  Navigator.pushAndRemoveUntil
    (context, MaterialPageRoute(builder: (context)=> widget), (Route<dynamic> route) => false,);
}


 Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
    // print('Mobile');
    return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
    // print('Wifi');
    return true;
    } else if (connectivityResult == ConnectivityResult.none) {
    print('No Connection');
    return false;
    } else {
    return false;
    }
}