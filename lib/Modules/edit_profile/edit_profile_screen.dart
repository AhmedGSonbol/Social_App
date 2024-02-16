import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';


class Edit_profile_screen extends StatelessWidget {


  var nameEditController = TextEditingController();
  var bioEditController = TextEditingController();
  var phoneEditController = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {
        if(state is AppUserUpdateErrorState)
        {

            myToast(msg: AppLang(context).checkYourDataFirstBeforeUpdate(), state: ToastStates.ERROR);

        }

        else if(state is AppUserUpdateSuccessState)
        {

          myToast(msg: AppLang(context).updateData(), state: ToastStates.SUCCESS);

        }
      },
      builder: (context, state)
      {
        AppLang lang = AppLang(context);

        var cubit = AppCubit.get(context);

        var userModel = cubit.user_model!;

        nameEditController.text = userModel.name! ;
        bioEditController.text = userModel.bio!;
        phoneEditController.text = userModel.phone!;

        var profileImage = cubit.profile_image;
        var coverImage = cubit.cover_image;

        return Directionality(
          textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Scaffold(
            appBar: defaultAppBar(
                context: context,
                title: lang.editProfile(),
                actions:
                [
                  myTextButton(context: context,text: lang.update(), function: ()
                  {
                    cubit.updateUser(name: nameEditController.text, bio: bioEditController.text, phone: phoneEditController.text);
                  }),
                  SizedBox(width: 10,)
                ]),


            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children:
                  [
                    if(state is AppUserUpdatingState)
                      LinearProgressIndicator(),
                      SizedBox(height: 10.0,),
                    // cover and profile images
                    Container(
                      height: 190,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
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
                                        image: coverImage == null ?  NetworkImage('${userModel.cover}') : FileImage(coverImage) as ImageProvider,
                                        fit: BoxFit.cover,

                                      )
                                  ),

                                ),
                                coverImage == null
                                    ?
                                IconButton(
                                  icon: CircleAvatar(

                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 20.0,
                                    ),
                                  ),
                                  onPressed: ()
                                  {
                                    cubit.getCoverImage();
                                  },
                                )
                                    :
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
                                    cubit.cancelUploadedCoverImage();
                                  },
                                ),
                              ],
                            ),

                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 64.0,
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage: profileImage == null ?  NetworkImage('${userModel.image}') : FileImage(profileImage) as ImageProvider,
                                ),
                              ),
                              profileImage == null
                                  ?
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
                              )
                                  :
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
                                  cubit.cancelUploadedProfileImage();
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
                                labelText: lang.userName(),
                                prefixIcon: IconBroken.User,
                                validator: (val)
                                {
                                  if(val!.isEmpty)
                                  {
                                    return lang.checkUserName();
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
                            labelText: lang.bio(),
                            prefixIcon: IconBroken.Info_Circle,
                            validator: (val)
                            {
                              if(val!.isEmpty)
                              {
                                return lang.checkBio();
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
                            controller: phoneEditController,
                            keyboardType: TextInputType.phone,
                            labelText: lang.phone(),
                            prefixIcon: IconBroken.Call,
                            validator: (val)
                            {
                              if(val!.isEmpty)
                              {
                                return lang.checkPhone();
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
            ),

          ),
        );

      },
    );
  }
}
