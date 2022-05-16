import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:task/shared/networking/remote/dio_helper.dart';
import 'package:task/shared/networking/remote/endpoints.dart';
import 'package:task/view/screens/phone_or_email_screen.dart';


class SignUpProvider extends ChangeNotifier {
  bool _password = true;
  bool _confrimPassword = true;
  bool get password => _password;
  bool get confrimPassword => _confrimPassword;

  void onClick() {
    _password = !_password;
    notifyListeners();
  }
  void onClickConfrim() {
    _confrimPassword = !_confrimPassword;
    notifyListeners();
  }
  Future<void> postSignUp ({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String tokenFirebase,
    required String deviceId,
    required BuildContext context,
  }) async {
    DioHelper.postData(
        url: Endpoints.signUp,
        data: {
          'name': name ,
          'phone': phone ,
          'email': email ,
          'password': password ,
          'confirm_password':confirmPassword,
          "token_firebase":tokenFirebase,
          "device_id":deviceId,
        }
    ).then((value) {
      print(value.data);
      if(value.statusCode == 200  ){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  PhoneOrEmailScreen(userEmail: email,userName: name,userPhone: phone,)));
      }
      else if(value.statusCode == 404 ||value.statusCode==422 ){
        print(value.data['message']);
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
        print(value.data['message']);
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