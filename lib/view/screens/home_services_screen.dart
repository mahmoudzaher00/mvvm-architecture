import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task/view/widget/color.dart';
import 'package:task/view/widget/custom_text.dart';
import 'package:task/view_model/home_services_provider.dart';

class HomeServiceScreen extends StatefulWidget {
  const HomeServiceScreen({Key? key}) : super(key: key);

  @override
  _HomeServiceScreenState createState() => _HomeServiceScreenState();
}

class _HomeServiceScreenState extends State<HomeServiceScreen> {
  bool servicesLoader = false;
  var select;
  Future<void> servicesFuture() async {
    servicesLoader = true;
    setState(() {

    });
    try {
      await Provider.of<HomeServicesProvider>(context, listen: false).getHomeService();
      servicesLoader = false;
    } catch (e) {
      servicesLoader = false;
      rethrow;
    }
    setState(() {

    });
  }
  @override
  void initState() {
    servicesFuture();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    final ref = Provider.of<HomeServicesProvider>(context,);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body:  SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12),
              height: _mediaQuery.height,
              width: _mediaQuery.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 1234.png',),
                  fit: BoxFit.fill
                )
              ),
              child: Column(
                children:[
                  SizedBox(height: _mediaQuery.height*.09,),
                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
                          },
                          child: Image.asset('assets/images/arrow.png')
                      ),
                      const SizedBox(width:20,),
                      CustomText(
                        text: 'الخدمات الرئيسية',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color:ApplicationColors.white,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  SizedBox(height: _mediaQuery.height*.07,),
                  servicesLoader?SizedBox(
                    height: _mediaQuery.height*.6,
                    width: _mediaQuery.width,
                    child: const Center(child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                  ):Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                           mainAxisSpacing: 10,
                          crossAxisSpacing: 10
                        ),
                        padding: EdgeInsets.zero,

                        itemCount:ref.servicesModel!.homeServicesData!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              ref.changeContainerColor(index);

                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                               // margin: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color:ref.select==index?Colors.white.withOpacity(0.6): Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center ,
                                  children: [

                                    CachedNetworkImage(
                                      imageUrl: ref.servicesModel!.homeServicesData![index].image!,fit: BoxFit.fill,
                                      imageBuilder: (context, imageProvider) => Container(
                                        height: 80,
                                        width: _mediaQuery.width*.2,
                                        decoration: BoxDecoration(
                                          boxShadow: [BoxShadow(
                                            color: Colors.grey.withOpacity(.3), //color of shadow
                                            spreadRadius: 1, //spread radius
                                            blurRadius: 1, // blur radius
                                            offset: const Offset(0, 2),
                                          )],
                                          // color: MyColors.primary,
                                          borderRadius: BorderRadius.circular(6),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => Image.asset('assets/images/error.png',width: _mediaQuery.width*.2,height: 80,),
                                      placeholder: (context, url) => Image.asset('assets/images/placeholder.png',width: _mediaQuery.width*.2,height: 80,),
                                    ),
                                    CustomText(
                                      text: ref.servicesModel!.homeServicesData![index].title,
                                      alignment:Alignment.center,
                                      textAlign: TextAlign.center,
                                      height: 1.5,
                                      color: ApplicationColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                  )
                                  ],
                                ),

                            ),
                          );
                        }),
                  ),

              ]),
            ),
          )
      ),
    );
  }
}
