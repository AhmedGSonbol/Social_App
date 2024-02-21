import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app/Models/Login_Model.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Modules/login/cubit/states.dart';
// import 'package:social_app/cubit/cubit.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late Login_Model loginModel;

  bool isSecure = true;

  IconData passIcon = Icons.visibility_off;

  void userLogin(context,{required String email , required String password})
  {
    emit(LoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value)
    {

      FirebaseMessaging.instance.getToken().then((tokenValue)
      {
        FirebaseFirestore.instance.collection('users').doc(value.user!.uid).update(
            {
              'FCM_token':tokenValue
            }
        ).then((val)
        {
          emit(LoginSuccessState(value.user!.uid));
        });
      });

    }).catchError((err)
    {
      emit(LoginErrorState(err.toString()));
    });


  }

  Future<UserCredential> signInWithFacebook() async
  {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }


  Future<void> signInWithGoogle() async
  {
    // GoogleSignIn().signOut();
    emit(GoogleLoginLoadingState());
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value)async
    {

      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      print(value.additionalUserInfo!.profile!['name']);
      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      print(value.user!.email);
      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      print(value.user!.uid);
      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      print(value.user!.photoURL);
      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

      if(value.additionalUserInfo!.isNewUser)
      {
        await createUser(
            uId: value.user!.uid ,
            name: value.additionalUserInfo!.profile!['name'] ,
            email: value.user!.email! ,
            image: value.user!.photoURL!,
        );
      }

      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      // print(value.credential.);
      // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      // print(value.additionalUserInfo!.isNewUser);

      // print(value.user!.emailVerified);
      // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

       // FirebaseAuth.instance.signOut();


      emit(GoogleLoginSuccessState(value.user!.uid));
    }).catchError((err)
    {
      emit(GoogleLoginErrorState(err.toString()));
      print(err.toString());
    });
  }



  Future<void> createUser({
    required String uId,
    required String email,
    required String name,
    required String image,

  })async
  {
    await FirebaseMessaging.instance.getToken().then((TokenValue)async
    {
      User_Model model = User_Model(
          uId: uId,
          name: name,
          email: email,
          phone: '',
          isEmailVrified: true,
          bio: 'write your bio ...',
          image: image,
          cover: 'https://img.freepik.com/free-psd/3d-render-digital-communication-background_23-2150762212.jpg?w=740&t=st=1703180352~exp=1703180952~hmac=2e944def7da0d55bacc74364688bbbffdd81bdfff3eb2d69e7ad41279c484361',
          FCM_token: TokenValue
      );

     await FirebaseFirestore.instance.collection('users').doc(uId).set(
          model.toMap()
      ).then((value)
      {

        emit(CreateUserSuccessState(uId));


      }).catchError((err)
      {
        emit(CreateUserErrorState(err.toString()));
        print(err.toString());
      });
    });





  }









  void changePassVisibility()
  {
    isSecure =! isSecure;
    if(isSecure)
    {
      passIcon = Icons.visibility_off;
    }
    else
    {
      passIcon = Icons.visibility;
    }
    emit(LoginSecureState());
  }

}