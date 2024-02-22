import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:social_app/Modules/edit_profile/edit_profile_screen.dart';
import 'package:social_app/Modules/home/home_Screen.dart';
import 'package:social_app/Modules/login/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/Shared/Classes/bloc_observer.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Network/Local/Cach_Helper.dart';
import 'package:social_app/Shared/Network/Remote/dio_Helper.dart';
import 'package:social_app/Shared/Styles/themes.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'package:social_app/firebase_options.dart';

import 'Models/notification_Model.dart';
import 'Models/user_Model.dart';
import 'Modules/chat_Details/chat_Details_Screen.dart';
import 'Modules/new_post/new_Post_Screen.dart';
// import 'firebase_options.dart';




void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  await CachHelper.init();
  DioHelper.init();
  // initNotifications();

  // await Permission.notification.isDenied.then((value)
  // {
  //   if (value)
  //   {
  //     Permission.notification.request();
  //   }
  // });


  Widget startScreen;
  bool isDark = false;
  String lang = 'en';


  uId = CachHelper.getData(key: 'uId') ?? '';

  if (uId != '')
  {
    startScreen = const Home_Screen();
  }
  else
  {
    startScreen = Login_Screen();
  }

  // uId = '5qhouenCOFh8dehxpwxGB6dfOdl2';


  if(CachHelper.getData(key: 'isdarkmode')!= null)
  {
    isDark = CachHelper.getData(key: 'isdarkmode');
  }

  if(CachHelper.getData(key: 'lang')!= null)
  {
    lang = CachHelper.getData(key: 'lang');
  }

  runApp(MainScreen(
    startScreen: startScreen,
    lang: lang,
    isDark: isDark,
  ));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainScreen extends StatelessWidget
{

  Widget startScreen;
  bool isDark;
  String lang;

  MainScreen({required this.startScreen , required this.isDark , required this.lang});

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => AppCubit()..lang = lang..isDarkMode = isDark..getAppData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          // print('###############################################################################');

          return MaterialApp(

            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: Directionality(
              child: startScreen,
              textDirection: AppCubit.get(context).lang == 'en' ? TextDirection.ltr : TextDirection.rtl,
          ),
          );
        },
      )
    );
  }

}

// Notification Initialization

void initNotifications()
{
  FirebaseMessaging.instance.getToken().then((value)
  {
    print(value);
  });

  FirebaseMessaging.onMessage.listen((event)
  {
    print('cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc');
    print(event.data.toString() );
    print('cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc');
    myToast(msg: 'on Message', state: ToastStates.SUCCESS);
    // print(event.notification!.body );
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event)async
  {
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print(event.data.toString() );
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    myToast(msg: 'on App Message', state: ToastStates.WARNING);

    Notification_Model notification_model = Notification_Model.fromJson(event.data);

    // print(notification_model.toMap());
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print(notification_model.type);
    print(notification_model.value);
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    if(notification_model.type == 'chat')
    {

      // Get.to(New_Post_Screen());
      print('5555555555555555555555555555555555555555555555555555');



        await FirebaseFirestore.instance.collection('users').doc(notification_model.value).get().then((value)
        {
          User_Model uModel = User_Model.fromJson(value.data()!);

          print('88888888888888888888888888888888');
          print(value.data());


          myToast(msg: notification_model.value, state: ToastStates.WARNING);
          navTo(navigatorKey.currentState!.context, Chat_Details_Screen(receiver_Model: uModel));

        });


        // Get.to();
        // navTo(context, Chat_Details_Screen(receiver_Model: value!));

    }

    // print(event.notification!.body );
  });

  FirebaseMessaging.onBackgroundMessage(background_Messaging);
}





@pragma('vm:entry-point')
Future<void> background_Messaging(RemoteMessage message)async
{
  print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
  print(message.data.toString() );
  print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
  myToast(msg: 'on Background Message', state: ToastStates.ERROR);

  // FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(userId)
  //     .collection('notifications')
  //     .add( model.toMap() )
  //     .then((value) {})
  //     .catchError((err){})  ;
}


// BlocProvider(
// create: (context) => AppCubit(),
// child: BlocConsumer<AppCubit,AppStates>(
// listener: (context, state) {},
// builder: (context, state) {
// return MaterialApp(
// debugShowCheckedModeBanner: false,
//
// home: startScreen,
// );
// },
// )
// );