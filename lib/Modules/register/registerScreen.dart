import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/home/home_Screen.dart';
// import 'package:social_app/Modules/home/shopLayout.dart';
import 'package:social_app/Modules/login/cubit/cubit.dart';
import 'package:social_app/Modules/register/cubit/cubit.dart';
import 'package:social_app/Modules/register/cubit/states.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Network/Local/Cach_Helper.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/cubit/cubit.dart';

class RegisterScreen extends StatelessWidget
{

  var emailController =TextEditingController();

  var passwordController =TextEditingController();

  var nameController =TextEditingController();

  var phoneController =TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {


    return BlocProvider(create: (context) => RegisterCubit(),
    child: BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context, state)
      {
        if(state is CreateUserSuccessState)
        {

          myToast(msg: 'You have been registered successfully !',state: ToastStates.SUCCESS ,);

          CachHelper.saveData(key: 'uId', value: state.uId).then((value)
          {
            uId = state.uId;
            AppCubit.get(context).getAppData();
            navAndFinishTo(context, Home_Screen());
          });

        }

        else if(state is RegisterErrorState)
        {

          if(state.error.contains('The email address is badly formatted'))
            myToast(msg: 'Your email address is not valid !',state: ToastStates.ERROR ,);

          if(state.error.contains('The email address is already in use by another account'))
            myToast(msg: 'The email address is already in use by another account !',state: ToastStates.ERROR ,);
        }

        else if(state is CreateUserErrorState)
        {
          myToast(msg: state.error,state: ToastStates.ERROR ,);
        }
      },
      builder: (context, state)
      {
        var cubit = RegisterCubit.get(context);

        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(langRegister(context),
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: fontColor(context)
                        ),),



                      SizedBox(height: 30,),


                      myTextFormField(
                          context: context,
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          labelText: langUserName(context),
                          prefixIcon: Icons.person,
                          validator: (String? val)
                          {
                            if(val!.isEmpty)
                            {
                              return langEnterYourUserName(context);
                            }

                          }
                      ),
                      SizedBox(height: 15.0),

                      myTextFormField(
                          context: context,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          labelText: langPhone(context),
                          prefixIcon: Icons.phone,
                          validator: (String? val)
                          {

                            if(val!.isEmpty)
                            {
                              return langEnterYourPhone(context);
                            }
                            if(val.length < 11)
                            {
                              return 'Your phone number must be at least 11 number';
                            }

                          }
                      ),
                      SizedBox(height: 15.0),

                      myTextFormField(
                          context: context,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: langEmailAddress(context),
                          prefixIcon: Icons.email_outlined,
                          validator: (String? val)
                          {
                            if(val!.isEmpty)
                            {
                              return langEnterYourEmailAddress(context);
                            }

                            if(!checkEmailValidation())
                            {
                              return "Your email address is not in a correct format !";
                            }

                          }
                      ),
                      SizedBox(height: 15.0),

                      myTextFormField(
                          context: context,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          labelText: langPassword(context),
                          isPassword: cubit.isSecure,
                          onFieldSubmitted: (val)
                          {
                            if(formKey.currentState!.validate())
                            {
                              cubit.userRegister(context,email: emailController.text, Password: passwordController.text ,name:nameController.text,phone:phoneController.text );
                            }
                          },
                          prefixIcon: Icons.lock_outline,
                          // suffixIcon: Icon(Icons.visibility),
                          // SuffixOnPressed: (){},
                          suffixButtonIcon: IconButton(
                              icon: Icon(cubit.passIcon),
                              onPressed: ()
                              {
                                cubit.changePassVisibility();
                              }
                          ),
                          validator: (String? val)
                          {
                            if(val!.isEmpty)
                            {
                              return langEnterYourPassword(context);
                            }

                            if(val.length < 6)
                            {
                              return 'Your password should be at least 6 characters !';
                            }
                          }
                      ),
                      SizedBox(height: 15.0),

                      state is! RegisterLoadingState
                          ?
                      myButton(text: langRegister(context), function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          cubit.userRegister(context,email: emailController.text, Password: passwordController.text ,name:nameController.text,phone:phoneController.text );
                        }

                      })
                          :
                      Center(
                        child: CircularProgressIndicator(),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
    );
  }

  bool checkEmailValidation()
  {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
  }
}
