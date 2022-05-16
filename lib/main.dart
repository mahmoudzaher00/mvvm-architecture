import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/shared/networking/remote/dio_helper.dart';
import 'package:task/shared/networking/local/shard_pref.dart';
import 'package:task/view/screens/home_services_screen.dart';
import 'package:task/view/screens/sign_in_screen.dart';
import 'package:task/view_model/home_services_provider.dart';
import 'package:task/view_model/otp_sign_up_provider.dart';
import 'package:task/view_model/phone_or_email_provider.dart';
import 'package:task/view_model/sign_in_provider.dart';
import 'package:task/view_model/sign_up_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider(),),
        ChangeNotifierProvider(create: (context) => SignUpProvider(),),
        ChangeNotifierProvider(create: (context) => PhoneOrEmailProvider()),
        ChangeNotifierProvider(create: (context) => OtpSignUpProvider()),
        ChangeNotifierProvider(create: (context) => HomeServicesProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Directionality(
          textDirection: TextDirection.rtl,
          child:   CacheHelper.getDataFromSharedPreference(key: 'info')==null? SignInScreen():const HomeServiceScreen(),
        ),
      ),
    );
  }
}


