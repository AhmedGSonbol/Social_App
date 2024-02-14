import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class SearchScreen extends StatelessWidget
{
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var searchController = TextEditingController();

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: mySendMessageSection(
                  icon: Icon(IconBroken.Search,color: Colors.white,),
                    context: context,
                    messageController: searchController,
                    onPressed: ()
                    {
                      if(searchController.text.isNotEmpty)
                      {
                        AppCubit.get(context).searchForUser(searchController.text);
                      }
                    },
                  textChange: (text)
                  {

                      AppCubit.get(context).searchForUser(text);

                  }
                ),
              ),

              Expanded(
                  child:AppCubit.get(context).searchUsersList.isNotEmpty && AppCubit.get(context).user_model != null && searchController.text.isNotEmpty
                      ?
                  ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildUserItem(AppCubit.get(context).searchUsersList[index],context),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: AppCubit.get(context).searchUsersList.length
                  )
                      :
                  Center(child:Text('Search results will be shown here ! :)')),
              )
            ],
          )
        );

      },
    );
  }

  Widget buildUserItem(User_Model model,context)
  {
    return InkWell(
      onTap: () {
        if (!AppCubit
            .get(context)
            .user_model!
            .isEmailVrified!) {
          myToast(msg: 'Please verify your email first !',
              state: ToastStates.WARNING);
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
