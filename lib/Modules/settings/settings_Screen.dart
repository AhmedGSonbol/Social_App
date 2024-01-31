import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Modules/edit_profile/edit_profile_screen.dart';
import 'package:social_app/Modules/new_post/new_Post_Screen.dart';
import 'package:social_app/Modules/post_Details/post_Details_Screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var userModel = AppCubit.get(context).user_model;


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
                              Text('Posts',
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
                              Text('Photos',
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
                              Text('Followers',
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
                              Text('Following',
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
                Row(
                  children:
                  [
                    Expanded(
                        child: OutlinedButton(
                          child: Text('Add Post'),
                          onPressed: ()
                          {
                            navTo(context, New_Post_Screen());
                          },
                        )
                        ),
                    SizedBox(width: 10.0,),
                    OutlinedButton(

                      child: Icon(
                          IconBroken.Edit,

                      ),

                      onPressed: ()
                      {
                        navTo(context, Edit_profile_screen());
                      },
                    )

                  ],
                ),


                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context , index)
                  {

                    return buildPostItem(AppCubit.get(context).myPosts[index],context);
                  } ,
                  itemCount: AppCubit.get(context).myPosts.length,
                )

              ],
            ),
          ),
        );

      },
    );
  }

  Widget buildPostItem(Post_Model model,context)
  {
    var commentController = TextEditingController();

    return Card(
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            //Person info
            Row(
              children:
              [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage('${model.image}'),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${model.name}',
                            style: const TextStyle(
                                height: 1.4
                            ),
                          ),
                          const SizedBox(width: 3,),
                          const Icon(Icons.check_circle,
                            color: defaultColor,
                            size: 16.0,
                          )
                        ],
                      ),
                      Text(DateFormat('E, yyyy/MM/dd  hh:mm a').format(DateTime.parse(model.datetime!)),
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              height: 1.4
                          )
                      )
                    ],
                  ),
                ),
                // const SizedBox(
                //   width: 15.0,
                // ),
                // IconButton(
                //   icon: const Icon(Icons.more_horiz,
                //     size: 18.0,),
                //   onPressed: (){},
                // )
              ],
            ),

            //Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),

            //Post Content
            Text('${model.text}',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            //Tags
            // Padding(
            //   padding: const EdgeInsets.only(
            //       bottom: 10.0,
            //       top: 5.0
            //   ),
            //   child: Container(
            //
            //     width: double.infinity,
            //     child: Wrap(
            //       children:
            //       [
            //         Container(
            //           height: 20.0,
            //           child: MaterialButton(
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               child: Text('#flutter',
            //                 style: TextStyle(
            //                     color: defaultColor
            //                 ),),
            //               onPressed: (){}),
            //         ),
            //         Container(
            //           height: 20.0,
            //           child: MaterialButton(
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               child: Text('#dart',
            //                 style: TextStyle(
            //                     color: Colors.blueAccent
            //                 ),),
            //               onPressed: (){}),
            //         ),
            //         Container(
            //           height: 20.0,
            //           child: MaterialButton(
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               child: Text('#application',
            //                 style: TextStyle(
            //                     color: Colors.blueAccent
            //                 ),),
            //               onPressed: (){}),
            //         ),
            //         Container(
            //           height: 20.0,
            //           child: MaterialButton(
            //               minWidth: 1.0,
            //               padding: EdgeInsets.zero,
            //               child: Text('#software_developer',
            //                 style: TextStyle(
            //                     color: Colors.blueAccent
            //                 ),),
            //               onPressed: (){}),
            //         ),
            //
            //       ],
            //       spacing: 5,
            //     ),
            //   ),
            // ),

            //Post Image

            if(model.postImage != "")
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Hero(
                  tag: model.postId!,
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage('${model.postImage}'),
                          fit: BoxFit.cover,

                        )
                    ),

                  ),
                ),
              ),

            //Likes and comments
            Padding(
              padding: const EdgeInsets.only(
                  top: 5
              ),
              child: Row(
                children:
                [

                  InkWell(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: const Icon(
                              IconBroken.Heart,
                              color: Colors.redAccent,

                            ),
                          ),
                        ),
                        Text('${model.likes}',
                          style: Theme.of(context).textTheme.bodySmall,),
                      ],
                    ),
                    onTap: (){},
                  ),

                  const Spacer(),

                  InkWell(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            IconBroken.Chat,
                            color: Colors.orange,
                          ),
                        ),
                        Text('${model.commentsCount}',
                          style: Theme.of(context).textTheme.bodySmall,),
                        const SizedBox(width: 5,),
                        Text('comments',
                          style: Theme.of(context).textTheme.bodySmall,),
                      ],
                    ),
                    onTap: ()
                    {
                      if(model.commentsCount != 0)
                      {
                        AppCubit.get(context).getPostComments(postID: model.postId!);
                        // myBottomSheet(
                        //     context: context,
                        //     model: model,
                        //   commentController: commentController
                        // );
                        navTo(context, Post_Details_Screen(post_model: model,hasComments: true,));
                      }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No comments !')));

                      }

                    },
                  ),


                ],
              ),
            ),

            //Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),

            //Add Comment and like
            Row(
              children:
              [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage('${AppCubit.get(context).user_model!.image}'),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    controller: commentController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Write a comment ...',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: InputBorder.none,
                    ),
                    onTap: ()
                    {
                      if(model.commentsCount != 0)
                      {
                        AppCubit.get(context).getPostComments(postID: model.postId!);
                      }
                      else
                      {
                        AppCubit.get(context).postComments = [];
                      }

                      // myBottomSheet(
                      //     context: context,
                      //     model: model,
                      //   commentController: commentController
                      // );
                      navTo(context, Post_Details_Screen(post_model: model,hasComments:model.commentsCount != 0 ? true : false,));
                    },
                    keyboardType: TextInputType.none,

                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: model.isLiked! ? Colors.red : Colors.transparent,
                          radius: 18.0,
                          child: Icon(
                            IconBroken.Heart,
                            color: model.isLiked! ? Colors.white :  Colors.redAccent,
                          ),
                        ),
                      ),
                      Text(model.isLiked! ? 'Liked' : 'Like',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: model.isLiked! ? Colors.red : Colors.grey
                        ),),
                    ],
                  ),
                  onTap: ()
                  {
                    AppCubit.get(context).likePost(postID: model.postId!);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
