import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

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
            itemBuilder: (context, index) => buildUserItem(AppCubit.get(context).users[index],context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: AppCubit.get(context).users.length
        )
            :
        Center(child: CircularProgressIndicator())
        ;

      },
    );
  }

  Widget buildUserItem(User_Model model,context)
  {
    return InkWell(
      onTap: ()
      {
        if(!AppCubit.get(context).user_model!.isEmailVrified!)
        {
          myToast(msg: 'Please verify your email first !', state: ToastStates.WARNING);
        }
        else {
          // send model
          navTo(context, Chat_Details_Screen(receiver_Model: model,));
        }
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
              style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4)
            ),

          ],
        ),
      ),
    );
  }
}
