import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
      builder: (context, state)
      {
        return AppCubit.get(context).users.isNotEmpty && AppCubit.get(context).user_model != null
            ?
        ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildChatItem(AppCubit.get(context).users[index],context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: AppCubit.get(context).users.length
        )
            :
            Center(child: CircularProgressIndicator())
        ;

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
            SizedBox(
              width: 15.0,
            ),
            Text('${model.name}',
              style: TextStyle(
                  height: 1.4
              ),
            ),

          ],
        ),
      ),
    );
  }

}
