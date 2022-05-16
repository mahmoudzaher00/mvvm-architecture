import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task/view/widget/color.dart';
import 'package:task/view/widget/custom_text.dart';
import 'package:task/view_model/phone_or_email_provider.dart';

class PhoneOrEmailScreen extends StatelessWidget {
  final String userPhone;
  final String userName;
  final String userEmail;
  const PhoneOrEmailScreen({required this.userPhone, required this.userName, required this.userEmail});
  @override
  Widget build(BuildContext context) {
    final ref = Provider.of<PhoneOrEmailProvider>(context,);
    final _mediaQuery = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: ApplicationColors.white,
          body: SafeArea(
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
                        'assets/images/pad-lock-free-download-login-lock-combination-lock-security-transparent-png-151078.png'
                        //height: _mediaQuery.height*.236,
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
                        text: ' مرحبا $userName !' ,
                        color: ApplicationColors.primary,
                      ),
                      SizedBox(height: _mediaQuery.height*.03,),
                      const CustomText(
                        text: 'تأكيد التسجيل يالتطبيق',
                        color: Colors.lightGreen,
                        fontSize: 12,
                      ),
                      SizedBox(height: _mediaQuery.height*.116,),
                      CustomText(
                            width: _mediaQuery.width,
                            textAlign: TextAlign.center,
                            text: 'برجاء تحديد واحد من الخيارات التالية لإرسال الكود ',
                            color: ApplicationColors.primary,
                            fontSize: 12,
                          ),
                      SizedBox(height: _mediaQuery.height*.03,),
                      Center(
                        child: InkWell(
                          onTap: (){

                            ref.postSendOtp(phoneOrEmail: userPhone, type: "phone",name: userName, context: context);
                            },
                          child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                color:Colors.lightGreen,
                                strokeWidth: 2,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                padding:  EdgeInsets.only(right: _mediaQuery.width*.06,left: 2,top: 8,bottom: 8),
                                height: _mediaQuery.height*.13,
                                width: _mediaQuery.width*.9,
                                color: Colors.lightBlue[50],
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/mobile-app (1).png'),
                                    SizedBox(width: _mediaQuery.width*.06,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children:  const [
                                        CustomText(
                                          text: 'رقم الجوال',
                                          color: Colors.lightGreen,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          alignment:Alignment.centerLeft,

                                        ),
                                        CustomText(
                                          text: 'ادخل رقم الجوال لارسال رمز التحقق',
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          alignment:Alignment.centerLeft,

                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: _mediaQuery.height*.03,),
                      Center(
                        child: InkWell(
                          onTap: (){
                            ref.postSendOtp(phoneOrEmail: userEmail, type: "email",name: userName, context: context);
                          },
                          child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                color:Colors.lightGreen,
                                strokeWidth: 2,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                padding:  EdgeInsets.only(right: _mediaQuery.width*.06,left: 2,top: 8,bottom: 8),
                                height: _mediaQuery.height*.13,
                                width: _mediaQuery.width*.9,
                                color: Colors.lightBlue[50],
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/email (10).png'),
                                    SizedBox(width: _mediaQuery.width*.06,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children:  const [
                                        CustomText(
                                          text: 'البريد الإلكتروني',
                                          color: Colors.lightGreen,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          alignment:Alignment.centerLeft,

                                        ),
                                        CustomText(
                                          text: 'ادخل البريد الإلكتروني لارسال رمز التحقق',
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          alignment:Alignment.centerLeft,

                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }


}
