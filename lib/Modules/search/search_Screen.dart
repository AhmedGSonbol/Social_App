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

        AppLang lang = AppLang(context);

        return Directionality(
          textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text(lang.search()),
            ),
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
                        itemBuilder: (context, index) => buildUserItem(AppCubit.get(context).searchUsersList[index],context,lang),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: AppCubit.get(context).searchUsersList.length
                    )
                        :
                    Center(child:Text(lang.searchResultWillBeShownHere(),style: Theme.of(context).textTheme.titleMedium,)),
                )
              ],
            )
          ),
        );

      },
    );
  }

}
