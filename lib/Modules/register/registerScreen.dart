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

          myToast(msg: AppLang(context).registeredSuccessfully(),state: ToastStates.SUCCESS ,);

          CachHelper.saveData(key: 'uId', value: state.uId).then((value)
          {
            uId = state.uId;

            AppCubit.get(context).getAppData();

            navAndFinishTo(context, const Home_Screen());
          });

        }

        else if(state is RegisterErrorState)
        {

          if(state.error.contains('The email address is badly formatted'))
            myToast(msg: AppLang(context).emailAddressIsNotValid(),state: ToastStates.ERROR ,);

          if(state.error.contains('The email address is already in use by another account'))
            myToast(msg: AppLang(context).emailAlreadyInUse(),state: ToastStates.ERROR ,);
        }

        else if(state is CreateUserErrorState)
        {
          myToast(msg: 'Error',state: ToastStates.ERROR ,);
        }
      },
      builder: (context, state)
      {
        AppLang lang = AppLang(context);

        var cubit = RegisterCubit.get(context);

        return Directionality(
          textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Scaffold(
            appBar: defaultAppBar(context: context),
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
                        Text(lang.register(),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: fontColor(context)
                          ),),



                        const SizedBox(height: 30,),


                        myTextFormField(
                            context: context,
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            labelText: lang.userName(),
                            prefixIcon: Icons.person,
                            validator: (String? val)
                            {
                              if(val!.isEmpty)
                              {
                                return lang.checkUserName();
                              }

                            }
                        ),
                        const SizedBox(height: 15.0),

                        myTextFormField(
                            context: context,
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            labelText: lang.phone(),
                            prefixIcon: Icons.phone,
                            validator: (String? val)
                            {

                              if(val!.isEmpty)
                              {
                                return lang.checkPhone();
                              }
                              if(val.length < 11)
                              {
                                return lang.phoneNumber11();
                              }

                            }
                        ),
                        const SizedBox(height: 15.0),

                        myTextFormField(
                            context: context,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            labelText: lang.emailAddress(),
                            prefixIcon: Icons.email_outlined,
                            validator: (String? val)
                            {
                              if(val!.isEmpty)
                              {
                                return lang.checkEmailAddressField();
                              }

                              if(!checkEmailValidation())
                              {
                                return lang.incorrectEmailFormat();
                              }

                            }
                        ),
                        const SizedBox(height: 15.0),

                        myTextFormField(
                            context: context,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            labelText: lang.password(),
                            isPassword: cubit.isSecure,
                            onFieldSubmitted: (val)
                            {
                              if(formKey.currentState!.validate())
                              {
                                cubit.userRegister(context,email: emailController.text, password: passwordController.text ,name:nameController.text,phone:phoneController.text );
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
                                return lang.checkPasswordField();
                              }

                              if(val.length < 6)
                              {
                                return lang.password6char();
                              }
                            }
                        ),
                        const SizedBox(height: 15.0),

                        state is! RegisterLoadingState
                            ?
                        myButton(text: lang.register(), function: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            cubit.userRegister(context,email: emailController.text, password: passwordController.text ,name:nameController.text,phone:phoneController.text );
                          }

                        })
                            :
                        const Center(
                          child: CircularProgressIndicator(),
                        ),


                      ],
                    ),
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
