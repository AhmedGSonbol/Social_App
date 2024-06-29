import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/edit_profile/edit_profile_screen.dart';
import 'package:social_app/Modules/new_post/new_Post_Screen.dart';
import 'package:social_app/Modules/post_Details/post_Details_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'package:social_app/generated/l10n.dart';

class ProfileScreen extends StatelessWidget
{
  ProfileScreen({Key? key ,this.viewerUserModel}) : super(key: key);

  User_Model? viewerUserModel;

  @override
  Widget build(BuildContext context)
  {
    var lang = S.of(context);

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);

        User_Model userModel = viewerUserModel ?? cubit.user_model!;

        // print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
        // print(userModel!.toMap());
        // print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
        // print(cubit.user_model!.toMap());

        if(cubit.allPostsLoaded)
        {
          cubit.getUserPosts(userModel.uId!);
        }

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children:
            [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 15.0),
                color: backgroundColor(context),
                child: Column(
                  children:
                  [
                    Container(
                      height: 190,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Container(
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage('${userModel.cover}'),
                                    fit: BoxFit.cover,

                                  )
                              ),

                            ),
                          ),
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage('${userModel.image}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(children:
                      [
                        Text('${userModel.name}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 5.0,),
                        Text('${userModel.bio}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                        [
                          Expanded(
                            child: InkWell(
                              child: Column(
                                children:
                                [
                                  Text('104',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(lang.posts,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                children:
                                [
                                  Text('33',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(lang.photos,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                children:
                                [
                                  Text('13K',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(lang.followers,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Column(
                                children:
                                [
                                  Text('167',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(lang.following,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){},
                            ),
                          ),
                        ],
                      ),
                    ),

                    userModel.uId == uId
                        ?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children:
                        [
                          Expanded(
                              child: OutlinedButton(
                                onPressed: ()
                                {
                                  if(!cubit.user_model!.isEmailVrified!)
                                  {
                                    myToast(msg: lang.verifyYourEmail, state: ToastStates.WARNING);
                                  }
                                  else {
                                    navTo(context, New_Post_Screen());
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide( color: Colors.grey),
                                ),
                                child: Text(lang.addPost,style: Theme.of(context).textTheme.titleMedium,),
                              )
                          ),
                          const SizedBox(width: 10.0,),
                          OutlinedButton(

                            onPressed: ()
                            {
                              navTo(context, Edit_profile_screen());
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide( color: Colors.grey),
                            ),

                            child: Icon(
                              IconBroken.Edit,
                              color: cubit.isDarkMode ? Colors.white : Colors.black,
                            ),
                          )

                        ],
                      ),
                    )
                        :
                    const SizedBox(),

                  ],
                ),
              ),

              cubit.allPostsLoaded
                  ?
              cubit.userPosts.isNotEmpty
                  ?
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context , index)
                {
                  return buildPostItem(cubit.userPosts[index],context , lang);
                  } ,
                itemCount: cubit.userPosts.length,
                padding: const EdgeInsets.symmetric(vertical: 5.0),
              )
              :
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(lang.noPosts,style: Theme.of(context).textTheme.titleMedium,),
                  )
                  :
                  const Padding(
                    padding: EdgeInsets.only(top:15.0 ),
                    child: CircularProgressIndicator(),
                  )

            ],
          ),
        );

      },
    );
  }

}
