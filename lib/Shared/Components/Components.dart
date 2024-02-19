import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/chat_Details/chat_Details_Screen.dart';
import 'package:social_app/Modules/new_post/new_Post_Screen.dart';
import 'package:social_app/Modules/post_Details/post_Details_Screen.dart';
import 'package:social_app/Modules/view_User_Profile/view_User_Profile_Screen.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';



void navTo(context , route)
{
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
}

void navAndFinishTo(context , route)
{
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => route));
}

Widget myButton({

  required String text,
  required void Function() function,

  double radius = 0.0,
  bool isUpperCase = true,
  Color textColor = Colors.white,
  double width = double.infinity,
  Color color = Colors.blue,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius)
    ),

    child: MaterialButton(
      height: 40.0,
      onPressed: function,
      child: Text(
        isUpperCase ?  text.toUpperCase() : text,
        style: TextStyle(color: textColor),),
    ),
  );
}


Widget myTextButton({
  required String text,
  required BuildContext context,
  required void Function() function,
}) => TextButton(child: Text(text.toUpperCase() , style:  Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4)) , onPressed: function,);



Widget myTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText,
  required IconData prefixIcon,
  required String? Function(String? x) validator,
  required context,

  void Function(String x)?  onChanged,
  void Function(String x)?  onFieldSubmitted,
  // void Function() SuffixOnPressed  = (){},
  bool isPassword = false,
  // Widget? suffixIcon,
  IconButton? suffixButtonIcon ,

})
{
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: isPassword,
    style: TextStyle(color: fontColor(context)),
    decoration: InputDecoration(
      prefixIconColor: fontColor(context),
        suffixIconColor: fontColor(context),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixButtonIcon,
        labelStyle: TextStyle(color: fontColor(context)),
        // IconButton(
        //   icon: suffixIcon!,
        //   onPressed: SuffixOnPressed,
        // ),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.grey),
        ),
        // border: const OutlineInputBorder()
    ),

    validator: validator,
    onFieldSubmitted: onFieldSubmitted,
    onChanged: onChanged,
  );
}


void myToast({
  required String msg,
  required ToastStates state,

  Color textColor = Colors.white,
  Toast toastLength = Toast.LENGTH_LONG,
  ToastGravity gravity = ToastGravity.BOTTOM,
  int timeInSecForIosWeb = 1,
  double fontSize = 16.0,


})
{
      Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: toastBackgroundColor(state),
      textColor: textColor,
      fontSize: fontSize,
  );
}

enum ToastStates {SUCCESS , ERROR , WARNING}

Color toastBackgroundColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}


Widget myDivider() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Container(width: double.infinity , height: 2.0 ,color: Colors.grey.withOpacity(0.5),),
);


Widget myCachedNetworkIMG({required String url , double? width , double? height , BoxFit? fit})
{
  return CachedNetworkImage(
    imageUrl: url,
     width: width,
     height: height,
    fit: fit,

    errorWidget: (context, url, error) => Container(
      height: height,
      width: width,
      child: const Center(child: Icon(Icons.error,color: Colors.grey,size: 40.0,),),),
  );
}


// void noInternetDialog(context,Function() refresh)
// {
//
//
//
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (context)
//     {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25.0),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//
//         child: Stack(
//           children: [
//             Container(
//               // padding: EdgeInsets.only(top: 200),
//               height: 300,
//               color: Colors.transparent,
//
//             ),
//
//             Container(
//               margin: EdgeInsets.only(top: 50),
//               padding: EdgeInsets.only(top: 70.0,left: 20,right: 20),
//
//               height: 240,
//               width: 300,
//               decoration: BoxDecoration(
//                 // color: AppCubit.get(context).isDarkMode ? darkColor : Colors.white,
//                 borderRadius: BorderRadius.circular(25.0),
//                 shape: BoxShape.rectangle,
//                 boxShadow:
//                 [
//                   BoxShadow(color: Colors.black,blurRadius: 10.0,offset: Offset(0,10))
//                 ]
//               ),
//               child: Column(
//                 children:
//                 [
//                 Center(
//                   child: Text(
//                     langConnectionError(context),
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: fontColor(context)),
//               ),
//                 ),
//
//                   Center(
//                     child: Text(
//                       langConnectionErrorDescription(context),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16.0,color: Colors.grey),
//                     ),
//                   ),
//
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: TextButton(
//                       child: Text(langreTry(context)),
//                       onPressed: refresh
//                     ),
//                   )
//                 ],
//               ),
//             ),
//
//             Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: CircleAvatar(
//                     radius: 60.0,
//                     child: Image(image: AssetImage('assets/images/offline.png')),
//                     backgroundColor: Colors.transparent,
//                   ),
//                 ),
//             )
//
//
//           ],
//
//
//         ),
//
//       );
//     },
//   );
// }

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  Widget? title,
  List<Widget>? actions,
})
{
  return AppBar(
    leading: IconButton(
      icon: AppLang(context).isEn ? const Icon(IconBroken.Arrow___Left_2) : const Icon(IconBroken.Arrow___Right_2),
      onPressed: () => Navigator.of(context).pop(),
    ),

    title: title ?? const Text(''),
    actions: actions,
    titleSpacing: 5.0,
  );
}

Widget mySendMessageSection(
    {
      required context,
      required TextEditingController messageController,
      required void Function() onPressed,
      void Function(String text)? textChange,
      Widget icon = const  Icon(
        IconBroken.Send,
        color: Colors.white,
        size: 18.0,
      ),
    })
{
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[300]!,
            width: 1.0
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0),
        ),

      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        children:
        [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0
              ),
              child: TextFormField(
                style: TextStyle(color: fontColor(context)),
                onChanged: textChange,
                controller: messageController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppCubit.get(context).lang == 'en' ? 'Type your message here ...' : 'أكتب هنا ...',

                ),
              ),
            ),
          ),
          Container(

            decoration: BoxDecoration(
                color: defaultColor,
              borderRadius: BorderRadius.circular(9.0)
            ),
            child: MaterialButton(
              onPressed: onPressed,
              minWidth: 1.0,
              child: icon
            ),
          )
        ],
      ),
    ),
  );
}

Future<User_Model> getUserDataByUid({
  required String userId
})async
{
  User_Model uModel = User_Model();
  await FirebaseFirestore.instance.collection('users').doc(userId).get().then((value)
  {
    uModel = User_Model.fromJson(value.data()!);

    print('88888888888888888888888888888888');
    print(uModel.toMap());
    print('88888888888888888888888888888888');




  });

  return uModel;
  // print('NULLLLLLLLLLLLLLLLLLLLLLLLLLLL');
  //
  // return User_Model.fromJson({});


}

Widget buildPostItem(Post_Model model,context , AppLang lang ,
    {bool isOnHomeScreen = false})
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
          InkWell(
            child: Row(
              children:
              [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage('${model.image!.replaceAll('"', '')}'),
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
                          Flexible(
                            child: Text('${model.name}',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
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
                      ),
                      if(model.uId == uId && !isOnHomeScreen)
                        Row(
                          children:
                          [
                            Icon(model.type! == 'private' ? IconBroken.Lock : IconBroken.User , color: Colors.grey,size: 18.0,),
                            const SizedBox(width: 4.0,),
                            Text(model.type! == 'private' ? lang.privatePost() : lang.publicPost(),
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  height: 1.4
                              )
                      ),

                          ],
                        )
                    ],
                  ),
                ),

                if(model.uId == uId && !isOnHomeScreen)
                  PopupMenuButton(
                    child: Icon(Icons.adaptive.more,color: Colors.grey,),
                    color: const Color.fromRGBO(99, 99, 99, 1),

                  itemBuilder: (context)
                  {
                    return
                      [
                        PopupMenuItem(

                          value: 'edit',
                          child: Row(
                            children:
                            [
                              Icon(IconBroken.Edit,color: fontColor(context),),
                              const SizedBox(width: 10.0,),
                              Text(lang.edit(),style: TextStyle(color: fontColor(context)),)
                            ],

                          ),
                        ),

                        PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children:
                          [
                            Icon(IconBroken.Delete,color: fontColor(context),),
                            const SizedBox(width: 10.0,),
                            Text(lang.delete(),style: TextStyle(color: fontColor(context)),)
                          ],

                        ),

                      ),

                      ];
                  },
                    onSelected: (item)
                    {
                      if(item == 'edit')
                      {
                        if(model.type == 'private')
                        {
                          AppCubit.get(context).postType = 'private';
                        }
                        else
                        {
                          AppCubit.get(context).postType = 'public';
                        }
                        navTo(context, New_Post_Screen(postModel: model,));
                      }
                      else
                      {
                        myDialog(
                            context: context,
                            title: lang.deletePostHeader(),
                            desc: lang.deletePostDesc(),
                            okText: lang.ok(),
                            cancelText: lang.cancel(),
                            okOnTap: ()
                            {
                              AppCubit.get(context).deletePost(postModel: model);
                            },
                        );
                      }
                    },
                )
              ],
            ),
            onTap: ()async
            {
              if(isOnHomeScreen)
              {

                if(model.uId == uId)
                {
                  AppCubit.get(context).changeBottomNav(4);

                }else
                {
                  await AppCubit.get(context)
                      .getUserModelById(model.uId!)
                      .then((value) {
                    navTo(context, View_User_Profile_Screen(userModel: value));
                  });
                }



              }
            },
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

          ReadMoreText('${model.text}',
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
                tag: model.postImage!,
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage('${model.postImage!.replaceAll('"', '')}'),
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
                        padding: const EdgeInsets.all(5.0),
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
                      Text(lang.comments(),
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
                      AppCubit.get(context).hasComments = true;
                      navTo(context, Post_Details_Screen(post_model: model));
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(lang.noComments())));

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
                backgroundImage: NetworkImage('${AppCubit.get(context).user_model!.image!.replaceAll('"', '')}'),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: TextField(
                  controller: commentController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: lang.writeAComment(),
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    border: InputBorder.none,
                  ),
                  onTap: ()
                  {
                    if(!AppCubit.get(context).user_model!.isEmailVrified!)
                    {
                      myToast(msg: lang.verifyYourEmail(), state: ToastStates.WARNING);
                    }
                    else
                    {
                      if(model.commentsCount != 0)
                      {
                        AppCubit.get(context).getPostComments(postID: model.postId!);
                        AppCubit.get(context).hasComments = true;
                      }
                      else
                      {
                        AppCubit.get(context).postComments = [];
                        AppCubit.get(context).hasComments = false;
                      }


                      navTo(context, Post_Details_Screen(post_model: model));

                    }


                  },
                  keyboardType: TextInputType.none,

                ),
              ),
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
                    Text(model.isLiked! ? lang.liked() : lang.like(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: model.isLiked! ? Colors.red : Colors.grey
                      ),),
                  ],
                ),
                onTap: ()
                {
                  if(!AppCubit.get(context).user_model!.isEmailVrified!)
                  {
                    myToast(msg: lang.verifyYourEmail(), state: ToastStates.WARNING);
                  }else {
                    AppCubit.get(context).likePost(postID: model.postId!);
                  }
                },
              ),
            ],
          )
        ],
      ),
    ),
  );
}


Widget buildUserItem(User_Model model,context,AppLang lang,{isSmallImg = false , isChatScreen = false})
{
  return InkWell(
    onTap: ()
    {

      // send model
      if(isChatScreen)
      {
        navTo(context, Chat_Details_Screen(receiver_Model: model,));
      }
      else
      {
        navTo(context, View_User_Profile_Screen(userModel: model,));
      }


    },
    child: Container(

      color: backgroundColor(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              CircleAvatar(
                radius: isSmallImg ? 20.0 : 25.0,
                backgroundImage: NetworkImage('${model.image}'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Text('${model.name}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.4),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );
}

Future myDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required String okText,
  required String cancelText,
  required void Function() okOnTap,

})
{
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: title,
    desc: desc,
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: true,
    btnCancelColor: Colors.red.withOpacity(0.8),
    dismissOnBackKeyPress: true,
    dismissOnTouchOutside: true,
    btnCancelOnPress: () {},
    btnOkText: okText,
    btnCancelText: cancelText,

    btnOkOnPress: okOnTap

  ).show();
}










