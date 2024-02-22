import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:social_app/Models/comment_Model.dart';
import 'package:social_app/Models/message_Model.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Modules/post_Details/post_Details_Screen.dart';
import 'package:social_app/Modules/view_User_Profile/view_User_Profile_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class FeedsScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        AppLang lang = AppLang(context);

        var cubit = AppCubit.get(context);

        if (cubit.homePosts.isNotEmpty && cubit.user_model != null)
        {
          return RefreshIndicator(
            onRefresh: ()
            {
              return cubit.getPosts();
            },
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children:
              [
                Card(
                  margin: const EdgeInsets.all(8.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:
                    [
                      const Image(
                        image: AssetImage('assets/images/img1.jpg'),
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(lang.communicate(),
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context , index)
                  {
                    //  getUserDataByUid(userId: cubit.posts[index].uId!).then((value)
                    // {
                    //   print('ssssssssssssssssssssssssssssssssss');
                    //   print(value!.toMap());
                    // });
                     return buildPostItem(cubit.homePosts[index],context , lang,isOnHomeScreen: true);



                  } ,
                  itemCount: cubit.homePosts.length,
                ),


              ],
            ),
        ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }

      },
    );
  }


}
