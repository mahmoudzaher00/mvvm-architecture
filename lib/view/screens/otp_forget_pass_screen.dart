import 'dart:async';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:task/shared/components/components.dart';
import 'package:task/view/screens/forget_password_screen.dart';
import 'package:task/view/widget/color.dart';
import 'package:task/view/widget/custom_text.dart';

class OtpForgetPasswordScreen extends StatefulWidget {

  OtpForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<OtpForgetPasswordScreen> createState() => _OtpForgetPasswordScreenState();
}

class _OtpForgetPasswordScreenState extends State<OtpForgetPasswordScreen> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;

  String currentText = "";

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: ApplicationColors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          height: _mediaQuery.height*.64-statusBarHeight,
                          margin:  EdgeInsets.only(top: _mediaQuery.height*.009),
                          width: _mediaQuery.width,
                          child: Image.asset('assets/images/Group 3147.png',fit:BoxFit.fill,
                          )
                      ),
                      SizedBox(height:_mediaQuery.height*.03 ,),
                      Container(
                        height: _mediaQuery.height*.321,
                        padding: const EdgeInsets.only(left: 20),
                        width: _mediaQuery.width*.5,
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/Mask Group 3.png'),
                                fit: BoxFit.fill
                            )
                        ),
                        child: Image.asset(
                            "assets/images/62429906-golden-key-and-pisolated-on-white-removebg-preview.png"
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:  EdgeInsets.only(top: _mediaQuery.height*.04,left: 8,right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'مرحبا !',
                          color: ApplicationColors.primary,
                        ),
                        SizedBox(height: _mediaQuery.height*.03,),
                        const CustomText(
                          text: 'نسيت كلمة المرور',
                          color: Colors.lightGreen,
                          fontSize: 12,
                        ),
                        SizedBox(height: _mediaQuery.height*.116,),
                        Center(
                          child: CustomText(
                            text: 'كود التحقق',
                            color: ApplicationColors.primary,
                          ),
                        ),

                        SizedBox(height: _mediaQuery.height*.03),
                        Padding(
                          padding:  EdgeInsets.only(left: _mediaQuery.width*0.1,right: _mediaQuery.width*0.1),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: PinCodeTextField(
                              length: 4,
                              appContext: context,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: 60,
                                fieldWidth: 55,
                                disabledColor: Colors.white,
                                activeColor: ApplicationColors.primary,
                                selectedColor:  ApplicationColors.primary,
                                selectedFillColor: Colors.blue.shade50,
                                activeFillColor: Colors.blue.shade50,
                                inactiveFillColor: Colors.blue.shade50,
                                inactiveColor: Colors.white,
                              ),
                              animationDuration: const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              textInputAction: TextInputAction.done,
                              errorTextDirection: TextDirection.ltr,
                              keyboardType: TextInputType.number,
                              enablePinAutofill: true,
                              textCapitalization: TextCapitalization.none,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              onCompleted: (v) {},
                              onChanged: (value) {
                                setState(() {
                                  currentText = value;
                                });


                              },
                              beforeTextPaste: (text) {
                                return true;
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: _mediaQuery.height*.026,),
                        SizedBox(height: _mediaQuery.height*.028,),
                        Center(
                          child: SizedBox(
                            height:_mediaQuery.height*.06,
                            width: _mediaQuery.width*.5,
                            child: ElevatedButton(
                              onPressed: ()async{
                                if (textEditingController.text.isNotEmpty) {

                                  if (await checkInternetConnectivity()) {

                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  ForgetPasswordScreen()));

                                  }
                                  else{
                                    CherryToast(
                                        icon: Icons.wifi_off_rounded,
                                        themeColor: Colors.grey,
                                        title:  const Text(""),
                                        displayTitle:  false,
                                        description: const Text("لا يوجد اتصال بالانترنت",style: TextStyle(fontSize: 12),),
                                        toastPosition: POSITION.bottom,
                                        animationDuration: const Duration(milliseconds:  1000),
                                        toastDuration: const Duration(seconds:  5),
                                        autoDismiss:  true
                                    ).show(context);
                                  }

                                }else{
                                  CherryToast(
                                      icon: Icons.info,
                                      themeColor: Colors.grey,
                                      title:  const Text(""),
                                      displayTitle:  false,
                                      description: const Text("برجاء ادخال كود التحقق",style: TextStyle(fontSize: 12),),
                                      toastPosition: POSITION.bottom,
                                      animationDuration: const Duration(milliseconds:  1000),
                                      toastDuration: const Duration(seconds:  5),
                                      autoDismiss:  true
                                  ).show(context);
                                }

                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(ApplicationColors.primary),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      )
                                  )
                              ),
                              child:
                              CustomText(
                                text: 'تأكيد',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color:ApplicationColors.white,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: _mediaQuery.height*.028,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {  },
                              icon: Icon(Icons.refresh,color: ApplicationColors.primary,size: 18),
                            ),
                            InkWell(
                              onTap: (){

                              },
                              child: CustomText(
                                text: "إعادة المحاولة",
                                color: ApplicationColors.primary,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}
