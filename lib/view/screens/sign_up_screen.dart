import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task/shared/components/components.dart';
import 'package:task/view/screens/sign_in_screen.dart';
import 'package:task/view/widget/color.dart';
import 'package:task/view/widget/custom_text.dart';
import 'package:task/view_model/sign_up_provider.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController  passwordController = TextEditingController();
  final TextEditingController  confrimPasswordController = TextEditingController();
  final TextEditingController  phoneNumberController = TextEditingController();
  final TextEditingController  userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ref = Provider.of<SignUpProvider>(context,);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final _mediaQuery = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: ApplicationColors.white,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child:SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            height: _mediaQuery.height*.7,
                            margin:  EdgeInsets.only(top: _mediaQuery.height*.009),
                            width: _mediaQuery.width,
                            child: Image.asset('assets/images/Group 3147.png',fit:BoxFit.fill,
                            )
                        ),
                        Container(
                          padding:  EdgeInsets.only(top: _mediaQuery.height*.04,left: 10,right: 17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'مرحبا بعودتك !',
                                color: ApplicationColors.primary,
                              ),
                              SizedBox(height: _mediaQuery.height*.03,),
                              const CustomText(
                                text: 'إنشاء حساب لبدء التطبيق',
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
                                    text: '   تسجيل جديد',
                                    color: ApplicationColors.primary,
                                  ),
                                ],
                              ),
                              SizedBox(height: _mediaQuery.height*.03,),
                              SizedBox(
                                width: _mediaQuery.width*.9,
                                child: TextFormField(
                                  controller: userNameController,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: GoogleFonts.cairo(
                                      textStyle:const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                      )
                                  ),
                                  keyboardType: TextInputType.text,
                                  cursorColor:ApplicationColors.primary,
                                  decoration:   InputDecoration(
                                    isDense:true,
                                    contentPadding: const EdgeInsets.only(top: 14,bottom: 14,right: 8,left: 8),
                                    prefixIcon:Icon(Icons.person_outline_outlined,color: ApplicationColors.grey,size: 18) ,
                                    hintText: 'اسم المستخدم',
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
                                      return 'رجاء إدخال اسم المستخدم';
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
                                  controller: phoneNumberController,
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
                                  keyboardType: TextInputType.number,
                                  cursorColor:ApplicationColors.primary,
                                  decoration:   InputDecoration(
                                    isDense:true,
                                    contentPadding: const EdgeInsets.only(top: 14,bottom: 14,right: 8,left: 8),
                                    prefixIcon:Icon(Icons.phone_android,color: ApplicationColors.grey,size: 18) ,
                                    hintText: 'رقم الجوال',
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
                                      return 'رجاء إدخال رقم الجوال';
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
                                    hintText: ' كلمة المرور',
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
                                    }

                                    else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: _mediaQuery.height*.03,),
                              SizedBox(
                                width: _mediaQuery.width*.9,
                                child: TextFormField(
                                  controller: confrimPasswordController,
                                  textAlignVertical: TextAlignVertical.center,
                                  obscureText: ref.confrimPassword,
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
                                      icon: Icon( ref.confrimPassword ? Icons.visibility : Icons.visibility_off,color: ApplicationColors.grey,size: 18) ,
                                      onPressed: (){
                                        ref.onClickConfrim();
                                      },
                                    ) ,
                                    hintText: 'تأكيد كلمة المرور',
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
                                    if (value!.isEmpty && value != passwordController.text) {
                                      return 'رجاء إدخال كلمة المرور';
                                    }

                                    else {
                                      return null;
                                    }
                                  },
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
                                          ref.postSignUp(
                                              name: userNameController.text,
                                              confirmPassword: confrimPasswordController.text,
                                              phone: phoneNumberController.text,
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
                                    text: 'لديك حساب بالفعل   ',
                                    color: ApplicationColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,

                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignInScreen()));
                                    },
                                    child: CustomText(
                                      text: 'تسجيل الدخول',
                                      color: ApplicationColors.primary,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: _mediaQuery.height*.288,
                          padding: const EdgeInsets.only(left: 20),
                          width: _mediaQuery.width*.5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Mask Group 3.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                          child: Image.asset(
                            'assets/images/pngegg (18).png'
                            //height: _mediaQuery.height*.236,
                          ),
                        ),
                      ],
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
