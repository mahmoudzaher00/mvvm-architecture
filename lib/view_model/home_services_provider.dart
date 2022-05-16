

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/model/home_services_model.dart';
import 'package:task/shared/networking/remote/dio_helper.dart';
import 'package:task/shared/networking/remote/endpoints.dart';


class HomeServicesProvider extends ChangeNotifier {
  ServicesModel?servicesModel;
  var select;
  void changeContainerColor (int value){
    select=value;
    notifyListeners();
  }
  Future<ServicesModel?> getAds() async {
    Dio dio = Dio();
    var url = "https://beta.mawasims.com.sa/api/get-services";
    try {
      final response = await dio.get(
          url,
          options: Options(
            headers: {
              'Accept':'application/json',
              'Accept-Language':'ar',
            },
          )
      );
      servicesModel = ServicesModel.fromJson(response.data);
      print(response);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response!.statusCode}');
        print('DATA: ${e.response!.data}');
        print('HEADERS: ${e.response!.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    notifyListeners();
    return servicesModel;
  }
  Future<ServicesModel?> getHomeService() async {
    try{
     await DioHelper.getData(
        url: Endpoints.services,
      ).then((value) {
        print(value.data);
        servicesModel=ServicesModel.fromJson(value.data);
      });
    }
    catch(e){
      print(e.toString());
    }

    notifyListeners();
    return servicesModel;


  }

}