import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task/shared/components/components.dart';
import 'package:task/view/screens/home_services_screen.dart';
import 'package:task/view/screens/send_email_screen.dart';
import 'package:task/view/screens/sign_up_screen.dart';
import 'package:task/view/widget/color.dart';
import 'package:task/view/widget/custom_text.dart';
import 'package:task/view_model/sign_in_provider.dart';

class SignInScreen extends StatelessWidget {

   SignInScreen({Key? key}) : super(key: key);

   final TextEditingController  passwordController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ref = Provider.of<SignInProvider>(context,);
    final _mediaQuery = MediaQuery.of(context).size;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final appBar = AppBar().preferredSize.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ApplicationColors.white,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child:SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                        width: _mediaQuery.width*.52,
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/Mask Group 3.png'),
                                fit: BoxFit.fill
                            )
                        ),
                        child: Image.asset(
                          'assets/images/janitor-green-cleaning-cleaner-maid-service-general-cleaning-242a90a86e467ba39da141cc65ef61bc.png',
                          //height: _mediaQuery.height*.236,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding:  EdgeInsets.only(top: _mediaQuery.height*.04,left: 10,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'مرحبا بعودتك !',
                            color: ApplicationColors.primary,
                          ),
                          SizedBox(height: _mediaQuery.height*.03,),
                          const CustomText(
                            text: 'تسجيل الدخول للمتابعه',
                            color: Colors.lightGreen,
                            fontSize: 12,
                          ),
                          SizedBox(height: _mediaQuery.height*.116,),
                          Row(
                            children: [
                              Container(
                                height: 2,
                                width: 20,
                                color: ApplicationColors.primary,
                              ),
                              CustomText(
                                text: '   تسجيل الدخول',
                                color: ApplicationColors.primary,
                              ),
                            ],
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'رجاء إدخال البريد الإلكتروني';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(height: _mediaQuery.height*.03,),
                          SizedBox(
                            width: _mediaQuery.width*.9,
                            child: TextFormField(
                              controller: passwordController,
                              textAlignVertical: TextAlignVertical.center,
                              obscureText: ref.password,
                              style: GoogleFonts.cairo(
                                  textStyle:const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp('[ ]')),
                              ],
                              keyboardType: TextInputType.text,
                              cursorColor:ApplicationColors.primary,
                              decoration:   InputDecoration(
                                isDense:true,
                                contentPadding: const EdgeInsets.only(top: 14,bottom: 14,right: 8,left: 8),
                                prefixIcon:Icon(Icons.lock,color: ApplicationColors.grey,size: 18) ,
                                suffixIcon: IconButton(
                                  icon: Icon( ref.password ? Icons.visibility : Icons.visibility_off,color: ApplicationColors.grey,size: 18) ,
                                  onPressed: (){
                                    ref.onClick();
                                  },
                                ) ,
                                hintText: 'كلمة المرور',
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'رجاء إدخال كلمة المرور';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(height: _mediaQuery.height*.026,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SendEmailScreen(),));
                            },
                            child: CustomText(
                              width: _mediaQuery.width*.9,
                              text: 'نسيت كلمة المرور؟',
                              color: ApplicationColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              alignment:Alignment.centerLeft,

                            ),
                          ),
                          SizedBox(height: _mediaQuery.height*.028,),
                          Center(
                            child: SizedBox(
                              height:_mediaQuery.height*.06,
                              width: _mediaQuery.width*.5,
                              child: ElevatedButton(
                                onPressed: ()async{
                                  if (_formKey.currentState!.validate()) {
                                    if (await checkInternetConnectivity()) {
                                  ref.postSignIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  tokenFirebase: 'kghkghkghkghkhgs',
                                  deviceId: '554646464646',
                                  context: context
                                  );
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
                                  text: 'دخول',
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
                              CustomText(
                                text: 'ليس لديك حساب  ',
                                color: ApplicationColors.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,

                              ),
                              InkWell(
                                onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUpScreen()));
                                },
                                child: CustomText(
                                  text: 'تسجيل جديد',
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
      ),
        )
      ),
    );
  }
}
