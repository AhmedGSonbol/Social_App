import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Modules/view_User_Profile/view_User_Profile_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class UsersScreen extends StatelessWidget
{
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {


        AppLang lang = AppLang(context);

        return AppCubit.get(context).users.isNotEmpty && AppCubit.get(context).user_model != null
            ?
        ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildUserItem(AppCubit.get(context).users[index],context,lang),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: AppCubit.get(context).users.length,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
        )
            :
        Center(child: CircularProgressIndicator())
        ;

      },
    );
  }


}
