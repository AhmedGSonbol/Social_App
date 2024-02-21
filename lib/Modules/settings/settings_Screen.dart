import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/aboutDeveloper/about_Developer_Screen.dart';
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
      {
        if(state is AppLogoutErrorState)
        {
          myToast(msg: AppLang(context).connectionError(), state: ToastStates.ERROR);
        }
      },
      builder: (context, state)
      {
        AppLang lang = AppLang(context);

        var cubit = AppCubit.get(context);

        List<String> langs = [];

        if(cubit.lang == 'en')
        {
          langs = langEN;
        }
        else
        {
          langs = langAR;
        }


        return
          Directionality(
            textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
            child: Scaffold(

              appBar: defaultAppBar(context: context),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children:
                    [
                      Center(
                        child: Text(
                          lang.settings() ,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                              fontSize: 40.0
                          ),
                        ),
                      ),

                      const SizedBox(height: 50.0,),

                      Row(
                        children:
                        [
                          Column(
                            children:
                            [
                              Text(
                                lang.darkmode() ,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                    fontSize: 25.0
                                ),
                              ),
                              const SizedBox(height: 20.0,),
                              Text(
                                lang.language() ,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                    fontSize: 25.0
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 30.0,),

                          Column(
                            children:
                            [
                              Center(
                                child: Switch(
                                  // activeColor: defaultColor,
                                    activeTrackColor: defaultColor,
                                    inactiveTrackColor: Colors.grey.withOpacity(0.5),
                                    inactiveThumbColor: Colors.black,
                                    // activeColor: Colors.yellowAccent,

                                    value: cubit.isDarkMode,
                                    onChanged: (val)
                                    {
                                      cubit.changeMode();
                                    }
                                ),
                              ),
                              const SizedBox(height: 20.0,),
                              Center(
                                  child: DropdownButton(
                                    value:  langs[0] ,
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
                                      DropdownMenuItem(child: Text(langs[0]),value: langs[0],),
                                      DropdownMenuItem(child: Text(langs[1]) , value: langs[1],),
                                    ],
                                    style: TextStyle(fontSize: 17.0,color: fontColor(context)),
                                    dropdownColor: cubit.isDarkMode ? darkColor : Colors.white,
                                    iconEnabledColor: defaultColor,
                                    borderRadius: BorderRadius.circular(15.0),


                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                      const SizedBox(height: 20.0,),




                      myButton(
                          text: lang.aboutDeveloper(),
                          function: ()
                          {
                             navTo(context, About_Debeloper_Screen());
                          }),

                      const SizedBox(height: 20.0,),

                      myButton(
                          text: lang.logout(),
                          function: ()
                          {
                            cubit.logout(context);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
      },
    );
  }
}
