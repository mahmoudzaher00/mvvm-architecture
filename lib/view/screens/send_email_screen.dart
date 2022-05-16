import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task/view/screens/forget_password_screen.dart';
import 'package:task/view/screens/otp_forget_pass_screen.dart';
import 'package:task/view/screens/sign_up_screen.dart';
import 'package:task/view/widget/color.dart';
import 'package:task/view/widget/custom_text.dart';
import 'package:task/view_model/sign_in_provider.dart';

class SendEmailScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

   SendEmailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: ApplicationColors.white,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: SafeArea(
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
                            'assets/images/toppng.com-dudas-y-preguntas-png-question-mark-716x876.png'
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
                          text: ' مرحبا أحمد !' ,
                          color: ApplicationColors.primary,
                        ),
                        SizedBox(height: _mediaQuery.height*.03,),
                        const CustomText(
                          text: 'نسيت كلمة المرور',
                          color: Colors.lightGreen,
                          fontSize: 12,
                        ),
                        SizedBox(height: _mediaQuery.height*.116,),
                        CustomText(
                          text: 'برجاء إدخال البريد الإلكتروني لإرسال كود التحقق  ',
                          color: ApplicationColors.primary,
                          width: _mediaQuery.width,
                          fontSize: 12,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: _mediaQuery.height*.03,),
                        SizedBox(
                          width: _mediaQuery.width*.9,
                          child: TextFormField(
                            controller: emailController,
                            textAlignVertical: TextAlignVertical.center,
                            style: GoogleFonts.cairo(
                                textStyle:const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp('[ ]')),
                            ],
                            keyboardType: TextInputType.emailAddress,
                            cursorColor:ApplicationColors.primary,
                            decoration:   InputDecoration(
                              isDense:true,
                              contentPadding: const EdgeInsets.only(top: 14,bottom: 14,right: 8,left: 8),
                              prefixIcon:Icon(Icons.mail_outline,color: ApplicationColors.grey,size: 18) ,
                              hintText: 'البريد الإلكتروني',
                              hintStyle: GoogleFonts.cairo(
                                  textStyle:const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13
                                  )),
                              filled: true,
                              fillColor: ApplicationColors.liteGrey,
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:  BorderSide(
                                    color: ApplicationColors.liteGrey
                                ),
                              ),
                              enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: ApplicationColors.liteGrey
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: _mediaQuery.height*.03,),
                        Center(
                          child: SizedBox(
                            height:_mediaQuery.height*.06,
                            width: _mediaQuery.width*.5,
                            child: ElevatedButton(
                              onPressed: ()async{
                                emailController.text.isNotEmpty?
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  OtpForgetPasswordScreen())):
                                  CherryToast(
                                    icon: Icons.info_outline,
                                    themeColor: Colors.red.shade900,
                                    title:  const Text(""),
                                    displayTitle:  false,
                                    description: const Text("برجاء ادخال البريد الالكتروني",style: TextStyle(fontSize: 12),),
                                    toastPosition: POSITION.bottom,
                                    animationDuration: const Duration(milliseconds:  1000),
                                    toastDuration: const Duration(seconds:  5),
                                    autoDismiss:  true
                                ).show(context);
                                // if (_formKey.currentState!.validate()) {
                                //
                                //   }

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
                                text: 'إرسال',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color:ApplicationColors.white,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: _mediaQuery.height*.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'لم يتم الإرسال    ',
                              color: ApplicationColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,

                            ),
                            InkWell(
                              onTap: (){
                               // Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUpScreen()));
                              },
                              child: CustomText(
                                text: 'اعادة الارسال',
                                color: ApplicationColors.primary,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                textDecoration: TextDecoration.underline,


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
