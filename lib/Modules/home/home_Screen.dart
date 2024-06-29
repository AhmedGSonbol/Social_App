import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chats/chat_Screen.dart';
import 'package:social_app/Modules/feeds/feeds_Screen.dart';
import 'package:social_app/Modules/login/login_Screen.dart';
import 'package:social_app/Modules/new_post/new_Post_Screen.dart';
import 'package:social_app/Modules/profile/profile_Screen.dart';
import 'package:social_app/Modules/search/search_Screen.dart';
import 'package:social_app/Modules/settings/settings_Screen.dart';
import 'package:social_app/Modules/users/users_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Network/Local/Cach_Helper.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'package:social_app/generated/l10n.dart';


class Home_Screen extends StatelessWidget
{
  const Home_Screen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context)
  {

    var lang = S.of(context);

    List<Widget> navScreens =
    [
      FeedsScreen(),
      const ChatsScreen(),
      const UsersScreen(),
      ProfileScreen(),
    ];



    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {
        if(state is AppNewPostState)
        {
          navTo(context, New_Post_Screen());
        }
        if(state is AppEmailVerifiedState)
        {
          myToast(msg: lang.emailVerified, state: ToastStates.SUCCESS);
        }

        if(state is AppDeletePostSuccessState)
        {
          myToast(msg: lang.deletePostSuccess, state: ToastStates.SUCCESS);
        }

      },
      builder: (context, state)
      {

        List<String> titles =
        [
          lang.feedsHeader,
          lang.chats,
          lang.users,
          lang.profileHeader
        ];



        var cubit = AppCubit.get(context);


        return Scaffold(
          backgroundColor: cubit.isDarkMode ? darkColor :  const Color.fromRGBO(240, 240, 240, 1),
          appBar: AppBar(
            title: Text(
                titles[cubit.currentNavIndex > 2 ? cubit.currentNavIndex-1 : cubit.currentNavIndex]
            ),

            actions:
                cubit.currentNavIndex == 4
                    ?
                    [
                      IconButton(
                        icon: const Icon(IconBroken.Setting),
                        onPressed: ()
                        {
                          navTo(context, Settings_Screen());
                        },
                      ),

                    ]
                    :
                [

              // IconButton(
              //   icon: Icon(IconBroken.Notification),
              //   onPressed: (){},
              // ),

              IconButton(
                icon: const Icon(IconBroken.Search),
                onPressed: ()
                {
                  navTo(context,const SearchScreen());
                },
              ),
            ],
          ),
          body:  ((){
            if(cubit.user_model == null)
            {
              return const Center(child: CircularProgressIndicator());
            }
            else
            {
              return Column(
                children:
                [
                  // if(!cubit.isOnline)
                  //   Container(
                  //     color: Colors.redAccent.withOpacity(0.6),
                  //     height: 50.0,
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       child: Row(
                  //         children:
                  //         [
                  //           Icon(Icons.info_outline,color: Colors.white,),
                  //
                  //           SizedBox(width: 15,),
                  //
                  //           Expanded(child: Text(lang.offline(),style: TextStyle(color: Colors.white),)),
                  //
                  //           // myTextButton(context: context,text: lang.retry(), function: ()
                  //           // {
                  //           //  cubit.checkInternerConnection();
                  //           // })
                  //         ],
                  //       ),
                  //     ),
                  //   )
                  // else
                  //   SizedBox(),


                  if(!cubit.user_model!.isEmailVrified!)
                    Container(
                      color: defaultColor,
                      height: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children:
                          [
                            Icon(Icons.info_outline,color: fontColor(context),),

                            const SizedBox(width: 15,),

                            Expanded(child: Text(lang.verifyYourEmail,style: Theme.of(context).textTheme.titleMedium,)),

                            myTextButton(context: context,text: lang.send, function: ()
                            {
                              FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value)
                              {
                                myToast(msg: lang.checkYourMail, state: ToastStates.WARNING);
                              }).catchError((err)
                              {
                                myToast(msg: lang.offline, state: ToastStates.ERROR);
                              });
                            })
                          ],
                        ),
                      ),
                    )
                  else
                    const SizedBox(),

                  Expanded(
                    child: navScreens[cubit.currentNavIndex > 2 ? cubit.currentNavIndex-1 : cubit.currentNavIndex],
                  ),
                ],
              );
            }
          }()),


          // )

            bottomNavigationBar: BottomNavigationBar(
              onTap: (index)
              {
                cubit.changeBottomNav(index);
              },


              items:
              [
                BottomNavigationBarItem(
                    icon: const Icon(
                      IconBroken.Home
                    ),
                  label: lang.feeds
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                      IconBroken.Chat,
                  ),
                    label: lang.chats
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Paper_Upload,
                      color: cubit.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: lang.homePost,
                  backgroundColor: Colors.red
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                      IconBroken.User
                  ),
                    label: lang.users
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                      IconBroken.Profile
                  ),
                    label: lang.profile
                ),
              ],

              currentIndex: cubit.currentNavIndex > 2 ? cubit.currentNavIndex : cubit.currentNavIndex,

        ),




          // cubit.model != null
          //     ?
          // Column(
          //   children:
          //   [
          //     if(!FirebaseAuth.instance.currentUser!.emailVerified)
          //       Container(
          //       color: Colors.amber.withOpacity(0.6),
          //       height: 50.0,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20),
          //         child: Row(
          //           children:
          //           [
          //             Icon(Icons.info_outline),
          //
          //             SizedBox(width: 15,),
          //
          //             Expanded(child: Text('Please verify your email !')),
          //
          //             myTextButton(text: 'Send', function: ()
          //             {
          //               FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value)
          //               {
          //                 myToast(msg: 'check your email !', state: ToastStates.WARNING);
          //               }).catchError((err)
          //               {
          //                 myToast(msg: 'check your internet connection !', state: ToastStates.ERROR);
          //               });
          //             })
          //           ],
          //         ),
          //       ),
          //     )
          //
          //
          //   ],
          // )
          //     :
          //     Center(child: CircularProgressIndicator())

        );
      },
    );
  }
}
