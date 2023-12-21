import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/home/home_Screen.dart';
import 'package:social_app/Modules/login/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/Shared/Classes/bloc_observer.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Network/Local/Cach_Helper.dart';
import 'package:social_app/Shared/Styles/themes.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';
// import 'firebase_options.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CachHelper.init();

  Widget startScreen;

  uId = CachHelper.getData(key: 'uId');

  if (uId != null)
  {
    startScreen = Home_Screen();
  }
  else
  {
    startScreen = Login_Screen();
  }

  runApp(MainScreen(
    startScreen: startScreen,
  ));
}

class MainScreen extends StatelessWidget
{

  Widget startScreen;

  MainScreen({required this.startScreen});

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: startScreen,
          );
        },
      )
    );
  }

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