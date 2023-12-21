import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/edit_profile/edit_profile_screen.dart';
import 'package:social_app/Shared/Components/Components.dart';
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
                        child: Text('Add Photos'),
                        onPressed: (){},
                      )
                      ),
                  SizedBox(width: 10.0,),
                  OutlinedButton(
                    child: Icon(IconBroken.Edit),

                    onPressed: ()
                    {
                      navTo(context, Edit_profile_screen());
                    },
                  )

                ],
              )
            ],
          ),
        );

      },
    );
  }
}
