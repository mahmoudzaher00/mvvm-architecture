import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:task/shared/networking/local/shard_pref.dart';
import 'package:task/shared/networking/remote/dio_helper.dart';
import 'package:task/shared/networking/remote/endpoints.dart';
import 'package:task/view/screens/home_services_screen.dart';


class OtpSignUpProvider extends ChangeNotifier {

  Future<void> postOtpSingUp ({
    required String phoneOrEmail,
    required String code,
    required String type,

    required BuildContext context,
  }) async {
    DioHelper.postData(
        url: Endpoints.activeAccount,
        data: {
          'phone_or_email': phoneOrEmail,
          'code':code,
          "type":type,
        }
    ).then((value) {
      print(value.data);
      if(value.statusCode == 200  ){
        CacheHelper.putDataInSharedPreference(value: value.data['data']['token'], key: 'info');
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeServiceScreen(),), (Route<dynamic> route) => false,);
       //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (Route<dynamic> route) => false);
      }
      else if(value.statusCode == 404 ||value.statusCode == 422 ){
        CherryToast(
            icon: Icons.info_outline,
            themeColor: Colors.red.shade900,
            title:  const Text(""),
            displayTitle:  false,
            description: Text("${value.data['message']}",style: const TextStyle(fontSize: 12),),
            toastPosition: POSITION.bottom,
            animationDuration: const Duration(milliseconds:  1000),
            toastDuration: const Duration(seconds:  5),
            autoDismiss:  true
        ).show(context);
      }
      else{
        CherryToast(
            icon: Icons.info_outline,
            themeColor: Colors.red.shade900,
            title:  const Text(""),
            displayTitle:  false,
            description: Text("${value.data['message']}",style: const TextStyle(fontSize: 12),),
            toastPosition: POSITION.bottom,
            animationDuration: const Duration(milliseconds:  1000),
            toastDuration: const Duration(seconds:  5),
            autoDismiss:  true
        ).show(context);
      }


    }).catchError((error){
      print(error.toString());
      notifyListeners();
    });
    notifyListeners();
  }

}