import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_app/Models/comment_Model.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'dart:ui' as ui;

import 'package:social_app/generated/l10n.dart';

class Post_Details_Screen extends StatelessWidget
{
  Post_Details_Screen({required this.post_model } );
  Post_Model post_model;

  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    var lang = S.of(context);

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        return Scaffold(

          appBar:defaultAppBar(context: context,title:  Text(lang.postComments),),
          body: buildPostItem(post_model , context,lang),
        );

      },
    );
  }

  Widget buildPostItem(Post_Model model,context, S lang)
  {


    var cubit = AppCubit.get(context);

    return Column(
      children:
      [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Card(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${model.name}',
                                  style:  Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4),
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


                    if(model.postImage != "")
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Hero(
                          tag: model.postImage!,
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
                                CircleAvatar(
                                  backgroundColor: model.isLiked! ? Colors.red : Colors.transparent,
                                  radius: 18.0,
                                  child: Icon(
                                    IconBroken.Heart,
                                    color: model.isLiked! ? Colors.white :  Colors.redAccent,
                                  ),
                                ),
                                const SizedBox(width: 5.0,),
                                Text( '(${model.likes})',
                                  style: Theme.of(context).textTheme.bodySmall!),
                              ],
                            ),
                            onTap: ()
                            {
                              if(!cubit.user_model!.isEmailVrified!)
                              {
                                myToast(msg: lang.verifyYourEmail, state: ToastStates.WARNING);
                              }else {
                                cubit.likePost(postID: model.postId!);
                              }
                            },
                          ),

                          // InkWell(
                          //   child: Row(
                          //     children: [
                          //       const Padding(
                          //         padding: EdgeInsets.all(8.0),
                          //         child: Icon(
                          //           IconBroken.Heart,
                          //           color: Colors.redAccent,
                          //
                          //         ),
                          //       ),
                          //       Text('${model.likes}',
                          //         style: Theme.of(context).textTheme.bodySmall,),
                          //     ],
                          //   ),
                          //   onTap: ()
                          //   {
                          //
                          //   },
                          // ),

                          const Spacer(),

                          Row(
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
                              Text(lang.comments,
                                style: Theme.of(context).textTheme.bodySmall,),
                            ],
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
                    // Row(
                    //   children:
                    //   [
                    //     CircleAvatar(
                    //       radius: 20.0,
                    //       backgroundImage: NetworkImage('${cubit.user_model!.image}'),
                    //     ),
                    //     const SizedBox(width: 10,),
                    //     Expanded(
                    //       child: TextField(
                    //         controller: commentController,
                    //         maxLines: 1,
                    //         decoration: InputDecoration(
                    //           hintText: 'Write a comment ...',
                    //           hintStyle: Theme.of(context).textTheme.bodySmall,
                    //           border: InputBorder.none,
                    //         ),
                    //         onTap: ()
                    //         {
                    //           if(model.commentsCount != 0)
                    //           {
                    //             cubit.getPostComments(postID: model.postId!);
                    //           }
                    //
                    //           // myBottomSheet(
                    //           //     context: context,
                    //           //     model: model,
                    //           //     commentController: commentController
                    //           // );
                    //         },
                    //         keyboardType: TextInputType.none,
                    //
                    //       ),
                    //     ),
                    //     InkWell(
                    //       child: Row(
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: CircleAvatar(
                    //               backgroundColor: model.isLiked! ? Colors.red : Colors.transparent,
                    //               radius: 18.0,
                    //               child: Icon(
                    //                 IconBroken.Heart,
                    //                 color: model.isLiked! ? Colors.white :  Colors.redAccent,
                    //               ),
                    //             ),
                    //           ),
                    //           Text(model.isLiked! ? 'Liked' : 'Like',
                    //             style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    //                 color: model.isLiked! ? Colors.red : Colors.grey
                    //             ),),
                    //         ],
                    //       ),
                    //       onTap: ()
                    //       {
                    //         cubit.likePost(postID: model.postId!);
                    //       },
                    //     ),
                    //   ],
                    // ),

                    buildCommentsSection(context: context,
                        commentController: commentController,
                        model: post_model,
                      cubit: cubit,
                      lang: lang
                    )
                  ],
                ),
              ),
            ),
          ),
        ),


        //Send Message Section
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: mySendMessageSection(
            lang: lang,
            context: context,
            messageController: commentController,


            onPressed: () {
              if (commentController.text.isNotEmpty) {
                cubit.commentPost(
                    postID: model.postId!,
                    commentText: commentController.text,
                    datetime: DateTime.now().toString()
                ).then((value) {
                  commentController.text = '';
                });
              }
            },
          ),
        )
      ],
    );
  }




  Widget buildCommentsSection({
    required BuildContext context,
    required Post_Model model,
    required TextEditingController commentController,
    required S lang,
    required AppCubit cubit
})
  {
    // return state is! AppGetCommentPostLoadingState
    //     ?
   return Column(
     children:
     [
       Padding(
           padding: const EdgeInsets.symmetric(vertical: 10),
           child:
           ((){
             if(cubit.hasComments)
             {
               if(cubit.postComments.isNotEmpty)
               {
                 return ListView.builder(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemBuilder: (context, index)
                   {
                     return commentItem(
                         context: context,
                         model: cubit.postComments[index],
                         postId: model.postId!,
                       cubit: cubit,
                       lang: lang
                     );
                   },
                   itemCount: cubit.postComments.length,
                 );
               }
               else
               {
                 return const Center(child: CircularProgressIndicator());
               }
             }
             else
             {
               return Center(child: Text(lang.noMessagesYet,style:  Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4),));
             }
           }())



       ),
     ],
   );
        // :
    // const Center(child: CircularProgressIndicator());
  }




  Widget commentItem({
    required BuildContext context,
    required Comment_Model model,
    required String postId,
    required S lang,
    required AppCubit cubit,
  })
  {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        myDialog(
                            context: context,
                            title: lang.deleteCommentHeader,
                            desc: lang.deleteCommentDesc,
                            okText: lang.ok,
                            cancelText: lang.cancel,
                            okOnTap: ()
                            {
                              cubit.deleteComment(postId: postId, commentId: model.commentId!);
                            },
                        );

                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:  BorderRadius.only(
                              bottomRight: Radius.circular(current_lang != 'ar'  ? 10.0 : 0.0),
                              bottomLeft: Radius.circular(current_lang != 'ar'  ? 0.0 : 10.0),
                              topRight: const Radius.circular(10.0),
                              topLeft: const Radius.circular(10.0),

                            ),
                            color: model.isMyComment! ? defaultColor.withOpacity(0.3) : Colors.grey.withOpacity(0.5)
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
                                style:Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,
                                    fontSize: 16)
                            ),
                            Text(
                              '${model.commentText}',
                              softWrap: true,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 14),),
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
