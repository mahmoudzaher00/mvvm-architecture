import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:task/shared/networking/remote/dio_helper.dart';
import 'package:task/shared/networking/remote/endpoints.dart';
import 'package:task/view/screens/otp_sign_up_screen.dart';




class PhoneOrEmailProvider extends ChangeNotifier {

  Future<void> postSendOtp ({
    required String phoneOrEmail,
    required String type,
    required String name,

    required BuildContext context,
  }) async {
    DioHelper.postData(
        url: Endpoints.activePhoneOrEmail,
        data: {
          type: phoneOrEmail,
          "type": type,
        }
    ).then((value) {
      print(value.data);
      if(value.statusCode == 200  ){
        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpSignUpScreen(
          type: type,
          phoneOrEmail: phoneOrEmail,
          name: name,
        )
        ));
        CherryToast(
            icon: Icons.info_outline,
            themeColor: Colors.red.shade900,
            title:  const Text(""),
            displayTitle:  false,
            description: Text("${value.data['data']['code']}",style: const TextStyle(fontSize: 12),),
            toastPosition: POSITION.bottom,
            animationDuration: const Duration(milliseconds:  1000),
            toastDuration: const Duration(seconds:  5),
            autoDismiss:  true
        ).show(context);
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
            themeColor: Colors.pink,
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