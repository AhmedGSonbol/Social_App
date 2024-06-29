import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Modules/view_User_Profile/view_User_Profile_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'package:social_app/generated/l10n.dart';

class SearchScreen extends StatelessWidget
{
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {

    var lang = S.of(context);

    var searchController = TextEditingController();

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        return Scaffold(

          appBar: AppBar(
            title: Text(lang.search),
          ),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: mySendMessageSection(
                  lang: lang,
                  isSearch: true,

                    context: context,
                    messageController: searchController,
                    onPressed: ()
                    {
                      if(searchController.text.isNotEmpty)
                      {
                        cubit.searchForUser(searchController.text);
                      }
                    },
                  textChange: (text)
                  {

                      cubit.searchForUser(text);

                  }
                ),
              ),

              Expanded(
                  child:cubit.searchUsersList.isNotEmpty && cubit.user_model != null && searchController.text.isNotEmpty
                      ?
                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildUserItem(cubit.searchUsersList[index],context),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: cubit.searchUsersList.length
                  )
                      :
                  Center(child:Text(lang.searchResultWillBeShownHere,style: Theme.of(context).textTheme.titleMedium,)),
              )
            ],
          )
        );

      },
    );
  }

}
