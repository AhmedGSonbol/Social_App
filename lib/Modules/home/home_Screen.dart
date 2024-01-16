import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/login/login_Screen.dart';
import 'package:social_app/Modules/new_post/new_Post_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Network/Local/Cach_Helper.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';


class Home_Screen extends StatelessWidget
{
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {
        if(state is AppNewPostState)
        {
          navTo(context, New_Post_Screen());
        }
      },
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);

        print(FirebaseAuth.instance.currentUser!.emailVerified);

        return Scaffold(
          appBar: AppBar(
            title: Text(
                cubit.titles[cubit.currentNavIndex > 2 ? cubit.currentNavIndex-1 : cubit.currentNavIndex]
            ),

            actions:
                cubit.currentNavIndex == 4
                    ?
                    [
                      IconButton(
                        icon: Icon(IconBroken.Logout),
                        onPressed: ()
                        {
                          FirebaseMessaging.instance.deleteToken().then((TokenValue)
                          {
                            FirebaseFirestore.instance.collection('users').doc(uId).set(
                                {
                                  'FCM_token':''
                                }
                            ).then((val)
                            {
                              CachHelper.removeData(key: 'uId').then((value)
                              {
                                navAndFinishTo(context, Login_Screen());
                                Future.delayed(Duration(seconds: 3),()
                                {
                                  cubit.currentNavIndex = 0;
                                });

                              });
                            });
                          });




                        },
                      ),
                    ]
                    :
                [

              IconButton(
                icon: Icon(IconBroken.Notification),
                onPressed: (){},
              ),

              IconButton(
                icon: Icon(IconBroken.Search),
                onPressed: () {},
              ),
            ],
          ),
          body: cubit.user_model == null
              ?
          Center(child: CircularProgressIndicator())
              :
          cubit.navScreens[cubit.currentNavIndex > 2 ? cubit.currentNavIndex-1 : cubit.currentNavIndex],

            bottomNavigationBar: BottomNavigationBar(
              onTap: (index)
              {
                cubit.changeBottomNav(index);
              },


              items: 
              [
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Home
                    ),
                  label: 'Feeds'
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconBroken.Chat,
                  ),
                    label: 'Chat'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Paper_Upload,
                      color: Colors.black,
                    ),
                    label: 'Post',
                  backgroundColor: Colors.red
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconBroken.User
                  ),
                    label: 'Users'
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      IconBroken.Setting
                  ),
                    label: 'Settings'
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
