import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/Modules/home/home_Screen.dart';
import 'package:social_app/Modules/login/cubit/cubit.dart';
// import 'package:social_app/Modules/login/cubit/cubit.dart';
import 'package:social_app/Modules/login/cubit/states.dart';
import 'package:social_app/Modules/register/registerScreen.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Components/constants.dart';
import 'package:social_app/Shared/Network/Local/Cach_Helper.dart';
import 'package:social_app/Shared/Network/Remote/dio_Helper.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/generated/l10n.dart';


class Login_Screen extends StatelessWidget
{

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();



  @override
  Widget build(BuildContext context)
  {
    var lang = S.of(context);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit , LoginStates>(
        listener: (context, state)
        {
          if(state is LoginSuccessState)
          {
              CachHelper.saveData(key: 'uId', value: state.uId).then((value)
              {
                uId = state.uId;

                AppCubit.get(context).getAppData();

                navAndFinishTo(context, const Home_Screen());
              });


          }

          else if(state is GoogleLoginSuccessState)
          {
            CachHelper.saveData(key: 'uId', value: state.uId).then((value)
            {
              uId = state.uId;

              AppCubit.get(context).getAppData();

              navAndFinishTo(context, const Home_Screen());
            });


          }

          else if(state is FacebookLoginSuccessState)
          {
            CachHelper.saveData(key: 'uId', value: state.uId).then((value)
            {
              uId = state.uId;

              AppCubit.get(context).getAppData();

              navAndFinishTo(context, const Home_Screen());
            });


          }

          else if(state is LoginErrorState)
          {


            // myToast(msg: langConnectionError(context),state: ToastStates.ERROR ,);
            if(state.error.contains('The supplied auth credential is incorrect'))
            {
              myToast(msg: lang.incorrectEmailOrPass,state: ToastStates.ERROR ,);
            }
            else if(state.error.contains('We have blocked all requests from this device due to unusual activity'))
            {
              myToast(msg: lang.tryAgainLater,state: ToastStates.ERROR ,);
            }
            else
            {
              myToast(msg: lang.internetConnectionError,state: ToastStates.ERROR ,);

            }

            print(state.error);

          }else if(state is GoogleLoginErrorState)
          {

              myToast(msg: lang.googleCancel,state: ToastStates.ERROR ,);

          }else if(state is FacebookLoginErrorState)
          {

            myToast(msg: lang.facebookCancel,state: ToastStates.ERROR ,);

          }
        },
        builder: (context, state)
        {

          var cubit = LoginCubit.get(context);

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [

                        //main picture
                        Center(child: SvgPicture.asset('assets/images/login.svg' , height: MediaQuery.of(context).size.height / 3, )),

                        //login text
                        Text(lang.login,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: fontColor(context)
                          ),),
                        // SizedBox(height: 10,),
                        // Text(langLoginNowToBrowseOurHotOffers(context),
                        //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        //       color: Colors.grey
                        //   ),),

                        const SizedBox(height: 30,),

                        //email field
                        myTextFormField(
                            context: context,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            labelText: lang.emailAddress,
                            prefixIcon: Icons.email_outlined,
                            textInputAction: TextInputAction.next,
                            validator: (String? val)
                            {
                              if(val!.isEmpty)
                              {
                                return lang.checkEmailAddressField;
                              }

                            }
                        ),
                        const SizedBox(height: 15.0),

                        //password field
                        myTextFormField(
                            context: context,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            labelText: lang.password,
                            isPassword: cubit.isSecure,
                            textInputAction: TextInputAction.send,
                            onFieldSubmitted: (val)
                            {
                              if(formKey.currentState!.validate())
                              {
                                cubit.userLogin(context,email: emailController.text, password: passwordController.text);
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
                                return lang.checkPasswordField;
                              }
                            }
                        ),
                        const SizedBox(height: 15.0),

                        //login button
                        state is! LoginLoadingState
                            ?
                        myButton(text: lang.login, function: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            cubit.userLogin(context,email: emailController.text, password: passwordController.text);
                          }

                        })
                            :
                        const Center(
                          child: CircularProgressIndicator(),
                        ),

                        const SizedBox(height: 15.0),

                        //or continue with
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children:
                            [
                              Expanded(

                                flex: 1,

                                child: Container(
                                  height: 1,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Center(child: Text(lang.orContinueWith , maxLines: 1,style: const TextStyle(color: Colors.grey),)),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 1,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),


                        const SizedBox(height: 20,),

                        //facebook || google
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            if(state is FacebookLoginLoadingState)
                              const CircularProgressIndicator()
                            else
                              InkWell(
                              onTap: ()
                              {
                                cubit.signInWithFacebook();
                              },
                              child: SizedBox(
                                width: 60,
                                child: Image.asset('assets/images/facebook.png',width: 40,height: 40,),
                              ),
                            ),

                            const SizedBox(width: 10,),

                            Container(
                              width: 1,
                              height: 25,
                              color: Colors.grey,

                            ),

                            const SizedBox(width: 10,),

                            if(state is GoogleLoginLoadingState)
                              const CircularProgressIndicator()
                            else
                              InkWell(
                              onTap: ()
                              {
                                cubit.signInWithGoogle();
                              },
                              child: SizedBox(
                                width: 60,
                                child: Image.asset('assets/images/google.png',width: 40,height: 40),
                              ),
                            ),
                          ],
                        ),

                        //do not have an account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Text(lang.donotHaveAnAcc,style: TextStyle(color: fontColor(context)),),
                            myTextButton(context: context,text: lang.register,color: defaultColor, function: ()
                            {

                               navTo(context, RegisterScreen());
                            })

                          ],
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
}
