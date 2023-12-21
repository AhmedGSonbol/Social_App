import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class Edit_profile_screen extends StatelessWidget {


  var nameEditController = TextEditingController();
  var bioEditController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);

        var userModel = cubit.user_model;
        nameEditController.text = userModel!.name;
        bioEditController.text = userModel.bio;

        var profileImage = cubit.profile_image;

        return Scaffold(
          appBar: defaultAppBar(
              context: context,
              title: 'Edit Profile',
              actions:
              [
                myTextButton(text: 'UPDATE', function: (){}),
                SizedBox(width: 10,)
              ]),


          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: 
              [
                // cover and profile images
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: 
                          [
                            Container(
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
                            IconButton(
                              icon: CircleAvatar(

                                  child: Icon(
                                      IconBroken.Camera,
                                    size: 20.0,
                                  ),
                              ),
                              onPressed: (){},
                            ),
                          ],
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage:  NetworkImage('${userModel!.image}'),
                              // backgroundImage: profileImage == null ? NetworkImage('${userModel!.image}'):FileImage(profileImage) ,
                            ),
                          ),
                          IconButton(
                            icon: CircleAvatar(

                              child: Icon(
                                IconBroken.Camera,
                                size: 20.0,
                              ),
                            ),
                            onPressed: ()
                            {
                              cubit.getProfileImage();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                //edit name
                Row(
                  children:
                  [
                    Expanded(
                        child: myTextFormField(
                            controller: nameEditController,
                            keyboardType: TextInputType.name,
                            labelText: 'Name',
                            prefixIcon: IconBroken.User,
                            validator: (val)
                            {
                              if(val!.isEmpty)
                              {
                                return 'Name must not be empty !';
                              }
                            },
                            context: context,
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children:
                  [
                    Expanded(
                      child: myTextFormField(
                        controller: bioEditController,
                        keyboardType: TextInputType.name,
                        labelText: 'Bio',
                        prefixIcon: IconBroken.Info_Circle,
                        validator: (val)
                        {
                          if(val!.isEmpty)
                          {
                            return 'Bio must not be empty !';
                          }
                        },
                        context: context,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        );

      },
    );
  }
}
