import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:social_app/Models/post_Model.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class New_Post_Screen extends StatelessWidget
{
   New_Post_Screen({this.postModel});

  Post_Model? postModel ;

  var postTextController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    postTextController.text = postModel?.text ?? '';

    AppCubit.get(context).postImageURL = postModel?.postImage == '' ? null :postModel?.postImage;



    return BlocConsumer<AppCubit,AppStates>
      (
      listener: (context, state)
      {
        if(state is AppUpdatePostSuccessState)
        {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state)
      {

       var cubit = AppCubit.get(context);

        AppLang lang = AppLang(context);

        User_Model userModer = cubit.user_model ?? User_Model();

        return Directionality(
          textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Scaffold(

            appBar: defaultAppBar(
                context: context,
                title: Text(postModel == null ? lang.addPost() : lang.editPostTitle()),
                actions:
                [
                  myTextButton(
                    context: context,
                      text: postModel == null ? lang.post() : lang.edit(),
                      function: () {
                        if (!AppCubit
                            .get(context)
                            .user_model!.isEmailVrified!)
                        {
                          myToast(msg: lang.verifyYourEmail(),
                              state: ToastStates.WARNING);
                        }
                        else
                        {
                          if (cubit.postImage == null && postTextController.text.trim().isEmpty)
                          {
                            myToast(msg: lang.addPostTextOrImage(),
                                state: ToastStates.ERROR);

                          }else
                          {
                            if (postModel == null)
                            {
                              cubit.createPost(

                                text: postTextController.text,
                              ).then((value)
                              {

                                postTextController.text = "";
                                cubit.cancelUploadedPostImage();
                                myToast(msg: lang.publishPost(),

                                    state: ToastStates.SUCCESS);
                              });
                            }
                            else
                            {

                              cubit.updatePost(
                                  text: postTextController.text,
                                  oldPostModel: postModel!
                              )
                                  .then((value)async
                              {

                                postTextController.text = "";

                                myToast(msg: lang.editPost(),

                                    state: ToastStates.SUCCESS);
                              });

                            }
                          }


                        }
                      })
                ]
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children:
                [
                  //Indecator
                  if(state is AppCreatePostLoadingState || state is AppUpdatePostLoadingState)
                    const LinearProgressIndicator(),

                  if(state is AppCreatePostLoadingState || state is AppUpdatePostLoadingState)
                    const SizedBox(height: 10.0,),

                  //User Card
                  Row(
                    children:
                    [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage('${userModer.image?.replaceAll('"', '')}'),
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
                                Text('${userModer.name}',
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      height: 1.4
                                  )
                                ),

                              ],
                            ),
                            DropdownButton(
                              value:  cubit.postType ,
                              onChanged: (val)
                              {
                                cubit.changePostType();
                              },
                              items:
                              [
                                DropdownMenuItem(child: Text(lang.publicPost()),value: 'public',),
                                DropdownMenuItem(child: Text(lang.privatePost()) , value: 'private',),
                              ],
                              style: TextStyle(fontSize: 17.0,color: fontColor(context)),
                              dropdownColor: cubit.isDarkMode ? darkColor : Colors.white,
                              iconEnabledColor: defaultColor,
                              borderRadius: BorderRadius.circular(15.0),


                            ),
                            // Text(lang.publicPost(),
                            //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            //         height: 1.4
                            //     )
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),

                  //Content
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0
                        ),
                        child: TextFormField(
                          controller: postTextController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                            color: fontColor(context)
                          ),



                          decoration: InputDecoration(
                              hintText: '${lang.whatIsInYourMind()} , ${userModer.name} ?',
                            border: InputBorder.none,
                            fillColor: Colors.black,


                          ),
                        ),
                      ),
                    ),
                  ),

                  //Picked Image
                  if(cubit.postImage != null || cubit.postImageURL != null)
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children:
                      [
                        Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image:  cubit.postImageURL != null ? NetworkImage(cubit.postImageURL!) : FileImage(cubit.postImage!) as ImageProvider,
                                fit: BoxFit.cover,

                              )
                          ),

                        ),

                        IconButton(
                          icon: const CircleAvatar(
                            backgroundColor: Colors.red,

                            child: Icon(
                              IconBroken.Delete,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: ()
                          {


                              cubit.cancelUploadedPostImage();


                          },
                        ),
                      ],
                  ),
                    ),

                  //Buttons
                  Row(
                    children:
                    [
                      Expanded(
                        child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              Icon(IconBroken.Image,color: cubit.isDarkMode ? Colors.white : Colors.black,),
                              const SizedBox(width: 5.0,),
                              Text(lang.addPhoto(),style: Theme.of(context).textTheme.titleMedium,)
                            ],

                          ),
                          onPressed: ()
                          {
                            cubit.getPostImage();
                          },
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        );

      },
    );
  }
}
