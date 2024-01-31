import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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


class Login_Screen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

                // AppCubit.get(context).getAppData();
                navAndFinishTo(context, Home_Screen());
              });


          }
          else if(state is LoginErrorState)
          {


            // myToast(msg: langConnectionError(context),state: ToastStates.ERROR ,);
            if(state.error.contains('The supplied auth credential is incorrect'))
            {
              myToast(msg: 'Your email or password is incorrect !',state: ToastStates.ERROR ,);
            }else if(state.error.contains('We have blocked all requests from this device due to unusual activity'))
            {
              myToast(msg: 'Please try again later !',state: ToastStates.ERROR ,);
            }

            print(state.error);
          }
        },
        builder: (context, state)
        {
          var cubit = LoginCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Image(image: AssetImage('assets/images/shopping.png')),
                      SizedBox(height: 15.0,),
                      Text(langLogIn(context),
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: fontColor(context)
                        ),),
                      SizedBox(height: 10,),
                      Text(langLoginNowToBrowseOurHotOffers(context),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.grey
                        ),),

                      SizedBox(height: 30,),


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
                              cubit.userLogin(context,Email: emailController.text, Password: passwordController.text);
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
                          }
                      ),
                      SizedBox(height: 15.0),

                      state is! LoginLoadingState
                          ?
                      myButton(text: langLogIn(context), function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          cubit.userLogin(context,Email: emailController.text, Password: passwordController.text);
                        }

                      })
                          :
                      Center(
                        child: CircularProgressIndicator(),
                      ),

                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text(langDontHaveAnAccount(context),style: TextStyle(color: fontColor(context)),),
                          myTextButton(text: langRegister(context), function: ()
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
          );
        },
      ),
    );
  }
}
