import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:social_app/Models/comment_Model.dart';
import 'package:social_app/Models/message_Model.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Shared/Components/Components.dart';
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
        var cubit = AppCubit.get(context);

        if (cubit.posts.isNotEmpty && cubit.user_model != null)
        {
          return RefreshIndicator(
            onRefresh: ()
            {
              return cubit.getPosts();

            },
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
                        child: Text('Communicate With Friends',
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

                    return buildPostItem(cubit.posts[index],context);
                  } ,
                  itemCount: cubit.posts.length,
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
                const SizedBox(
                  width: 15.0,
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz,
                    size: 18.0,),
                  onPressed: (){},
                )
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
                        myBottomSheet(
                            context: context,
                            model: model,
                          commentController: commentController
                        );
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

                      myBottomSheet(
                          context: context,
                          model: model,
                        commentController: commentController
                      );
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


  Future<dynamic> myBottomSheet({

    required BuildContext context,
    required Post_Model model,
    required TextEditingController commentController

  }) => showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {

          return state is! AppGetCommentPostLoadingState
              ?
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children:
              [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10
                      ),
                      child: AppCubit.get(context).postComments.isNotEmpty
                          ?
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index)
                        {
                          return commentItem(
                              context: context,
                              model: AppCubit.get(context).postComments[index],
                            postId: model.postId!
                          );
                        },
                        itemCount: AppCubit.get(context).postComments.length,
                      )
                          :
                      const Center(child: Text('No comments yet !'))
                  ),
                ),

                //message section
                myMessageSection(
                  context: context,
                  messageController: commentController,
                  icon: state is AppCommentPostLoadingState
                      ?
                  const SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(color: Colors.white))

                      :
                  const Icon(
                    IconBroken.Send,
                    color: Colors.white,
                    size: 18.0,
                  ),

                  onPressed: () {
                    if (commentController.text.isNotEmpty) {
                      AppCubit.get(context).commentPost(
                          postID: model.postId!,
                          commentText: commentController.text,
                          datetime: DateTime.now().toString()
                      ).then((value) {
                        commentController.text = '';
                      });
                    }
                  },
                )
              ],
            ),
          )
              :
          const Center(child: CircularProgressIndicator());
        },
      );
    },
  );

  Widget commentItem({
    required BuildContext context,
    required Comment_Model model,
    required String postId,
  })
  {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          children:
          [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('${model.userImage}'),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  InkWell(
                    onLongPress: ()
                    {
                      if(model.isMyComment!)
                      {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          headerAnimationLoop: false,
                          animType: AnimType.bottomSlide,
                          title: 'Delete comment !',
                          desc: 'Are you sure , you want to delete your comment ?',
                          buttonsTextStyle: const TextStyle(color: Colors.black),
                          showCloseIcon: true,
                          btnCancelColor: Colors.red.withOpacity(0.8),
                          dismissOnBackKeyPress: true,
                          dismissOnTouchOutside: true,
                          btnCancelOnPress: () {},
                          btnOkOnPress: ()
                          {

                            AppCubit.get(context).deleteComment(postId: postId, commentId: model.commentId!);
                          },

                        ).show();
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            ),
                            color: model.isMyComment! ? defaultColor.withOpacity(0.3) : Colors.grey[300]
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text('${model.userName}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                )),
                            Text(
                              '${model.commentText}',
                              softWrap: true,),
                          ],
                        )),
                  ),
                  const SizedBox(height: 5,),
                  Text(DateFormat('E, yyyy/MM/dd  hh:mm a').format(DateTime.parse(model.datetime!)),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.4
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
