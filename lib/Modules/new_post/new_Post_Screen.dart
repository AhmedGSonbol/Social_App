import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Shared/Components/Components.dart';
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

        return Scaffold(
          appBar: defaultAppBar(
              context: context,
              title: 'Create Post',
              actions:
              [
                myTextButton(
                    text: 'Post',
                    function: ()
                    {
                      cubit.createPost(
                          datetime: DateTime.now().toString(),
                          text: postTextController.text,
                      ).then((value)
                      {
                        postTextController.text = "";
                        cubit.cancelUploadedPostImage();
                        myToast(msg: 'Post has been published succesfully !', state: ToastStates.SUCCESS);
                      });
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
                      backgroundImage: AssetImage('assets/images/img2.jpg'),
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
                              Text('Ahmed Sonbol',
                                style: TextStyle(
                                    height: 1.4
                                ),
                              ),

                            ],
                          ),
                          Text('Public',
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
                        color: Colors.grey[300],
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

                        decoration: InputDecoration(
                            hintText: 'What is in your mind , Ahmed Sonbol ?',
                          border: InputBorder.none
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
                            Icon(IconBroken.Image),
                            SizedBox(width: 5.0,),
                            Text('Add Photo')
                          ],

                        ),
                        onPressed: ()
                        {
                          cubit.getPostImage();
                        },
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        child: Text('# Tag'),
                        onPressed: (){},
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
