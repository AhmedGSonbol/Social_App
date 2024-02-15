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

class ProfileScreen extends StatelessWidget
{
  ProfileScreen({Key? key ,required this.userModel}) : super(key: key);

  User_Model userModel;
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var userModel = AppCubit.get(context).user_model;

        appLang lang = appLang(context);

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children:
              [
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage('${userModel!.cover}'),
                                fit: BoxFit.cover,

                              )
                          ),

                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      CircleAvatar(
                        radius: 64.0,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage: NetworkImage('${userModel!.image}'),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('${userModel.name}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('${userModel.bio}',
                  style: Theme.of(context).textTheme.bodySmall,
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
                              Text(lang.posts(),
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
                              Text(lang.photos(),
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
                              Text(lang.followers(),
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
                              Text(lang.following(),
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
                  Row(
                  children:
                  [
                    Expanded(
                        child: OutlinedButton(
                          child: Text('Add Post',style: Theme.of(context).textTheme.titleMedium,),
                          onPressed: ()
                          {
                            if(!AppCubit.get(context).user_model!.isEmailVrified!)
                            {
                              myToast(msg: 'Please verify your email first !', state: ToastStates.WARNING);
                            }
                            else {
                              navTo(context, New_Post_Screen());
                            }
                          },
                        )
                        ),
                    SizedBox(width: 10.0,),
                    OutlinedButton(

                      child: Icon(
                          IconBroken.Edit,
                        color: AppCubit.get(context).isDarkMode ? Colors.white : Colors.black,
                      ),

                      onPressed: ()
                      {
                        navTo(context, Edit_profile_screen());
                      },
                    )

                  ],
                )
                    :
                myDivider(),


                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context , index)
                  {

                    return buildPostItem(AppCubit.get(context).userPosts[index],context,lang);
                  } ,
                  itemCount: AppCubit.get(context).userPosts.length,
                )

              ],
            ),
          ),
        );

      },
    );
  }

}
