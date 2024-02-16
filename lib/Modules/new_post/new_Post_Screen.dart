import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class New_Post_Screen extends StatelessWidget {

  var postTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>
      (
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        AppLang lang = AppLang(context);

        User_Model userModer = cubit.user_model!;

        return Scaffold(
          appBar: defaultAppBar(
              context: context,
              title: lang.addPost(),
              actions:
              [
                myTextButton(
                  context: context,
                    text: lang.post(),
                    function: ()
                    {
                      if(!AppCubit.get(context).user_model!.isEmailVrified!)
                      {
                        myToast(msg: lang.verifyYourEmail(), state: ToastStates.WARNING);
                      }
                      else
                      {
                        if(cubit.postImage == null && postTextController.text.trim().isEmpty)
                        {
                          myToast(msg: lang.addPostTextOrImage(), state: ToastStates.ERROR);
                          return;

                        }

                        cubit.createPost(
                          datetime: DateTime.now().toString(),
                          text: postTextController.text,
                        ).then((value)
                        {
                          postTextController.text = "";
                          cubit.cancelUploadedPostImage();
                          myToast(msg: lang.publishPost(), state: ToastStates.SUCCESS);
                        });
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
                if(state is AppCreatePostLoadingState)
                  LinearProgressIndicator(),

                if(state is AppCreatePostLoadingState)
                  SizedBox(height: 10.0,),

                //User Card
                Row(
                  children:
                  [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage('${userModer.image!.replaceAll('"', '')}'),
                    ),
                    SizedBox(
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
                          Text(lang.publicPost(),
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  height: 1.4
                              )
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                //Content
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
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
                if(cubit.postImage != null)
                  Container(
                    padding: EdgeInsets.all(2.0),
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
                              image: FileImage(cubit.postImage!) ,
                              fit: BoxFit.cover,

                            )
                        ),

                      ),

                      IconButton(
                        icon: CircleAvatar(
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
                            Icon(IconBroken.Image,color: AppCubit.get(context).isDarkMode ? Colors.white : Colors.black,),
                            SizedBox(width: 5.0,),
                            Text('Add Photo',style: Theme.of(context).textTheme.titleMedium,)
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
        );

      },
    );
  }
}
