import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';
import 'package:social_app/generated/l10n.dart';


class Edit_profile_screen extends StatelessWidget
{


  var nameEditController = TextEditingController();
  var bioEditController = TextEditingController();
  var phoneEditController = TextEditingController();


  @override
  Widget build(BuildContext context)
  {

    var lang = S.of(context);

    nameEditController.text = AppCubit.get(context).user_model!.name!;
    bioEditController.text = AppCubit.get(context).user_model!.bio!;
    phoneEditController.text = AppCubit.get(context).user_model!.phone!;

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {
        if(state is AppUserUpdateErrorState)
        {

            myToast(msg: lang.checkYourDataFirstBeforeUpdate, state: ToastStates.ERROR);

        }

        else if(state is AppUserUpdateSuccessState)
        {

          myToast(msg: lang.updateData, state: ToastStates.SUCCESS);

        }
      },
      builder: (context, state)
      {
        // AppLang lang = lang;

        var cubit = AppCubit.get(context);




        var profileImage = cubit.profile_image;
        var coverImage = cubit.cover_image;

        return Scaffold(

          appBar: defaultAppBar(
              context: context,
              title: Text(lang.editProfile),
              actions:
              [
                myTextButton(context: context,text: lang.update, function: ()
                {
                  cubit.updateUser(name: nameEditController.text, bio: bioEditController.text, phone: phoneEditController.text);
                }),
                const SizedBox(width: 10,)
              ]),


          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children:
                [
                  if(state is AppUserUpdatingState)
                    const LinearProgressIndicator(),
                    const SizedBox(height: 10.0,),


                  // cover and profile images
                  SizedBox(
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
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                    image: DecorationImage(
                                      image: coverImage == null ?  NetworkImage('${cubit.user_model!.cover}') : FileImage(coverImage) as ImageProvider,
                                      fit: BoxFit.cover,

                                    )
                                ),

                              ),
                              coverImage == null
                                  ?
                              IconButton(
                                icon: const CircleAvatar(

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
                                backgroundImage: profileImage == null ?  NetworkImage('${cubit.user_model!.image}') : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            profileImage == null
                                ?
                            IconButton(
                              icon: const CircleAvatar(

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
                                cubit.cancelUploadedProfileImage();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),

                  //name field
                  Row(
                    children:
                    [
                      Expanded(
                          child: myTextFormField(
                              controller: nameEditController,
                              keyboardType: TextInputType.name,
                              labelText: lang.userName,
                              prefixIcon: IconBroken.User,
                            textInputAction: TextInputAction.next,
                              validator: (val)
                              {
                                if(val!.isEmpty)
                                {
                                  return lang.checkUserName;
                                }
                              },
                              context: context,
                          ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  //bio field
                  Row(
                    children:
                    [
                      Expanded(
                        child: myTextFormField(
                          controller: bioEditController,
                          keyboardType: TextInputType.name,
                          labelText: lang.bio,
                          prefixIcon: IconBroken.Info_Circle,
                          textInputAction: TextInputAction.next,
                          validator: (val)
                          {
                            if(val!.isEmpty)
                            {
                              return lang.checkBio;
                            }
                          },
                          context: context,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  //phone filed
                  Row(
                    children:
                    [
                      Expanded(
                        child: myTextFormField(
                          controller: phoneEditController,
                          keyboardType: TextInputType.phone,
                          labelText: lang.phone,
                          prefixIcon: IconBroken.Call,
                          textInputAction: TextInputAction.done,
                          validator: (val)
                          {
                            if(val!.isEmpty)
                            {
                              return lang.checkPhone;
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

        );

      },
    );
  }
}
