import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'package:social_app/generated/l10n.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);

        var lang = S.of(context);


        return cubit.usersChatWith.isNotEmpty && cubit.user_model != null
            ?
        ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildUserItem(cubit.usersChatWith[index],context,isChatScreen: true),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.usersChatWith.length,
          padding: const EdgeInsets.symmetric(vertical: 5.0),
        )
            :
            Center(child: Text(lang.noChats,style: Theme.of(context).textTheme.titleMedium,));

      },
    );
  }

  Widget buildChatItem(User_Model model,context)
  {
    return InkWell(
      onTap: ()
      {
        // send model
        navTo(context, Chat_Details_Screen(receiver_Model: model,));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('${model.image}'),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Text('${model.name}',
              style: const TextStyle(
                  height: 1.4
              ),
            ),

          ],
        ),
      ),
    );
  }

}
