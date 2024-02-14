import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/login/login_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Network/Local/Cach_Helper.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';


class Settings_Screen extends StatelessWidget
{

  List<String> langEN = ['English' , 'Arabic'];
  List<String> langAR = [ 'العربية','الأنجليزية'];

  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<AppCubit , AppStates>(
      listener: (context, state)
      {},
      builder: (context, state)
      {


        var cubit = AppCubit.get(context);

        List<String> lang = [];

        if(cubit.lang == 'en')
        {
          lang = langEN;
        }
        else
        {
          lang = langAR;
        }


        return
          Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                    Center(child: Text(langSettings(context) , style: TextStyle(fontSize: 40.0,color: fontColor(context))),),
                    SizedBox(height: 50.0,),

                    Row(
                      children:
                      [
                        Text(langDarkMode(context) , style: TextStyle(fontSize: 25.0,color: fontColor(context)),),
                        Expanded(
                          child: Center(
                            child: Switch(

                                value: cubit.isDarkMode,
                                onChanged: (val)
                                {
                                  cubit.changeMode();
                                }
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0,),

                    Row(
                      children:
                      [
                        Text(langLanguage(context) , style: TextStyle(fontSize: 25.0,color: fontColor(context)),),
                        Expanded(
                          child: Center(
                              child: DropdownButton(
                                value:  lang[0] ,
                                onChanged: (val)
                                {
                                  if(val == 'Arabic')
                                  {
                                    if(cubit.lang == 'en')
                                    {
                                      cubit.changeLang();
                                    }
                                  }
                                  else
                                  {
                                    if(!(cubit.lang == 'en') && val == 'الأنجليزية')
                                    {
                                      cubit.changeLang();
                                    }
                                  }
                                },
                                items:
                                [
                                  DropdownMenuItem(child: Text(lang[0]),value: lang[0],),
                                  DropdownMenuItem(child: Text(lang[1]) , value: lang[1],),
                                ],
                                style: TextStyle(fontSize: 17.0,color: fontColor(context)),
                                dropdownColor: cubit.isDarkMode ? darkColor : Colors.white,
                                iconEnabledColor: defaultColor,
                                borderRadius: BorderRadius.circular(15.0),


                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0,),




                    myButton(
                        text: langAboutDeveloper(context),
                        function: ()
                        {
                          // navTo(context, Contact_Us_Screen());
                        }),
                    SizedBox(height: 20.0,),

                    myButton(
                        text: langLogOut(context),
                        function: ()
                        {
                          FirebaseMessaging.instance.deleteToken().then((TokenValue)
                          {
                            FirebaseFirestore.instance.collection('users').doc(uId).update(
                                {
                                  'FCM_token':''
                                }
                            ).then((val)
                            {
                              CachHelper.removeData(key: 'uId').then((value)
                              {
                                navAndFinishTo(context, Login_Screen());

                                cubit.currentNavIndex = 0;
                              });
                            });
                          });
                        }),
                  ],
                ),
              ),
            ),
          );
      },
    );
  }
}
