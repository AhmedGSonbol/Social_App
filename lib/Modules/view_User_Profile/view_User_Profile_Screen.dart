import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Modules/edit_profile/edit_profile_screen.dart';
import 'package:social_app/Modules/new_post/new_Post_Screen.dart';
import 'package:social_app/Modules/post_Details/post_Details_Screen.dart';
import 'package:social_app/Modules/profile/profile_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class View_User_Profile_Screen extends StatelessWidget
{
  View_User_Profile_Screen({Key? key , required this.userModel}) : super(key: key);


  User_Model userModel;
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        AppLang lang = AppLang(context);

        var cubit = AppCubit.get(context);

        return Directionality(
          textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Scaffold(
            backgroundColor: cubit.isDarkMode ? darkColor :  const Color.fromRGBO(240, 240, 240, 1),
            appBar:defaultAppBar(context: context,title: Text(userModel.name!)),
            body: ProfileScreen(viewerUserModel: userModel,),
            floatingActionButton: FloatingActionButton(
              child: const Icon(IconBroken.Message,size: 25.0),
                onPressed: ()
                {
                  if(!cubit.user_model!.isEmailVrified!)
                  {
                    myToast(msg: lang.verifyYourEmail(), state: ToastStates.WARNING);
                  }
                  else {
                    // send model
                    navTo(context, Chat_Details_Screen(receiver_Model: userModel,));
                  }
                }
            ),
          ),
        );

      },
    );
  }
}
