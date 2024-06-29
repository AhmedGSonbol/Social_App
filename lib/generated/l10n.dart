// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Please verify your email !`
  String get verifyYourEmail {
    return Intl.message(
      'Please verify your email !',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your email has been verified successfully`
  String get emailVerified {
    return Intl.message(
      'Your email has been verified successfully',
      name: 'emailVerified',
      desc: '',
      args: [],
    );
  }

  /// `You are offline !`
  String get offline {
    return Intl.message(
      'You are offline !',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Check your email !`
  String get checkYourMail {
    return Intl.message(
      'Check your email !',
      name: 'checkYourMail',
      desc: '',
      args: [],
    );
  }

  /// `News Feed`
  String get feedsHeader {
    return Intl.message(
      'News Feed',
      name: 'feedsHeader',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get feeds {
    return Intl.message(
      'Feed',
      name: 'feeds',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message(
      'Chats',
      name: 'chats',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get homePost {
    return Intl.message(
      'Post',
      name: 'homePost',
      desc: '',
      args: [],
    );
  }

  /// `Add Post`
  String get addPost {
    return Intl.message(
      'Add Post',
      name: 'addPost',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Please add text or image to your post before making a post !`
  String get addPostTextOrImage {
    return Intl.message(
      'Please add text or image to your post before making a post !',
      name: 'addPostTextOrImage',
      desc: '',
      args: [],
    );
  }

  /// `Post was published successfully !`
  String get publishPost {
    return Intl.message(
      'Post was published successfully !',
      name: 'publishPost',
      desc: '',
      args: [],
    );
  }

  /// `Post updated successfully !`
  String get editPost {
    return Intl.message(
      'Post updated successfully !',
      name: 'editPost',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get publicPost {
    return Intl.message(
      'Public',
      name: 'publicPost',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get privatePost {
    return Intl.message(
      'Private',
      name: 'privatePost',
      desc: '',
      args: [],
    );
  }

  /// `No Posts !`
  String get noPosts {
    return Intl.message(
      'No Posts !',
      name: 'noPosts',
      desc: '',
      args: [],
    );
  }

  /// `What is in your mind`
  String get whatIsInYourMind {
    return Intl.message(
      'What is in your mind',
      name: 'whatIsInYourMind',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get profileHeader {
    return Intl.message(
      'My Profile',
      name: 'profileHeader',
      desc: '',
      args: [],
    );
  }

  /// `Communicate With Friends`
  String get communicate {
    return Intl.message(
      'Communicate With Friends',
      name: 'communicate',
      desc: '',
      args: [],
    );
  }

  /// `comments`
  String get comments {
    return Intl.message(
      'comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `No comments !`
  String get noComments {
    return Intl.message(
      'No comments !',
      name: 'noComments',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Write a comment ...`
  String get writeAComment {
    return Intl.message(
      'Write a comment ...',
      name: 'writeAComment',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get photos {
    return Intl.message(
      'Photos',
      name: 'photos',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `No Messages Yet .`
  String get noMessagesYet {
    return Intl.message(
      'No Messages Yet .',
      name: 'noMessagesYet',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Search results will be shown here !`
  String get searchResultWillBeShownHere {
    return Intl.message(
      'Search results will be shown here !',
      name: 'searchResultWillBeShownHere',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Please change your data first to update !`
  String get checkYourDataFirstBeforeUpdate {
    return Intl.message(
      'Please change your data first to update !',
      name: 'checkYourDataFirstBeforeUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Data has been updated successfully`
  String get updateData {
    return Intl.message(
      'Data has been updated successfully',
      name: 'updateData',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkmode {
    return Intl.message(
      'Dark Mode',
      name: 'darkmode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `About Developer`
  String get aboutDeveloper {
    return Intl.message(
      'About Developer',
      name: 'aboutDeveloper',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Your email or password is incorrect!`
  String get incorrectEmailOrPass {
    return Intl.message(
      'Your email or password is incorrect!',
      name: 'incorrectEmailOrPass',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later !`
  String get tryAgainLater {
    return Intl.message(
      'Please try again later !',
      name: 'tryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Internet Connection Error !`
  String get internetConnectionError {
    return Intl.message(
      'Internet Connection Error !',
      name: 'internetConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get checkEmailAddressField {
    return Intl.message(
      'Enter Email',
      name: 'checkEmailAddressField',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get checkPasswordField {
    return Intl.message(
      'Enter password',
      name: 'checkPasswordField',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get donotHaveAnAcc {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'donotHaveAnAcc',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `User Name must not be empty !`
  String get checkUserName {
    return Intl.message(
      'User Name must not be empty !',
      name: 'checkUserName',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message(
      'Bio',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `Bio must not be empty !`
  String get checkBio {
    return Intl.message(
      'Bio must not be empty !',
      name: 'checkBio',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Phone must not be empty !`
  String get checkPhone {
    return Intl.message(
      'Phone must not be empty !',
      name: 'checkPhone',
      desc: '',
      args: [],
    );
  }

  /// `You have been registered successfully !`
  String get registeredSuccessfully {
    return Intl.message(
      'You have been registered successfully !',
      name: 'registeredSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Your email address is not valid !`
  String get emailAddressIsNotValid {
    return Intl.message(
      'Your email address is not valid !',
      name: 'emailAddressIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already in use by another account !`
  String get emailAlreadyInUse {
    return Intl.message(
      'The email address is already in use by another account !',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Your phone number must be at least 11 numbers!`
  String get phoneNumber11 {
    return Intl.message(
      'Your phone number must be at least 11 numbers!',
      name: 'phoneNumber11',
      desc: '',
      args: [],
    );
  }

  /// `Your email address is not in a correct format !`
  String get incorrectEmailFormat {
    return Intl.message(
      'Your email address is not in a correct format !',
      name: 'incorrectEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Your password should be at least 6 characters !`
  String get password6char {
    return Intl.message(
      'Your password should be at least 6 characters !',
      name: 'password6char',
      desc: '',
      args: [],
    );
  }

  /// `Edit Post`
  String get editPostTitle {
    return Intl.message(
      'Edit Post',
      name: 'editPostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Add Photo`
  String get addPhoto {
    return Intl.message(
      'Add Photo',
      name: 'addPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Delete comment !`
  String get deleteCommentHeader {
    return Intl.message(
      'Delete comment !',
      name: 'deleteCommentHeader',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure, you want to delete your comment ?`
  String get deleteCommentDesc {
    return Intl.message(
      'Are you sure, you want to delete your comment ?',
      name: 'deleteCommentDesc',
      desc: '',
      args: [],
    );
  }

  /// `Delete post !`
  String get deletePostHeader {
    return Intl.message(
      'Delete post !',
      name: 'deletePostHeader',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure, you want to delete your post ?`
  String get deletePostDesc {
    return Intl.message(
      'Are you sure, you want to delete your post ?',
      name: 'deletePostDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Post Comments`
  String get postComments {
    return Intl.message(
      'Post Comments',
      name: 'postComments',
      desc: '',
      args: [],
    );
  }

  /// `The post has been successfully deleted !`
  String get deletePostSuccess {
    return Intl.message(
      'The post has been successfully deleted !',
      name: 'deletePostSuccess',
      desc: '',
      args: [],
    );
  }

  /// `There are no chats yet !`
  String get noChats {
    return Intl.message(
      'There are no chats yet !',
      name: 'noChats',
      desc: '',
      args: [],
    );
  }

  /// `Connection Error, Please connect to the internet !`
  String get connectionError {
    return Intl.message(
      'Connection Error, Please connect to the internet !',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get orContinueWith {
    return Intl.message(
      'or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Link your account with`
  String get linkYourAccountWith {
    return Intl.message(
      'Link your account with',
      name: 'linkYourAccountWith',
      desc: '',
      args: [],
    );
  }

  /// `Linked`
  String get linked {
    return Intl.message(
      'Linked',
      name: 'linked',
      desc: '',
      args: [],
    );
  }

  /// `Not linked`
  String get notLinked {
    return Intl.message(
      'Not linked',
      name: 'notLinked',
      desc: '',
      args: [],
    );
  }

  /// `Google sign in has been canceled !`
  String get googleCancel {
    return Intl.message(
      'Google sign in has been canceled !',
      name: 'googleCancel',
      desc: '',
      args: [],
    );
  }

  /// `Facebook sign in has been canceled !`
  String get facebookCancel {
    return Intl.message(
      'Facebook sign in has been canceled !',
      name: 'facebookCancel',
      desc: '',
      args: [],
    );
  }

  /// `Type your message here ...`
  String get typeYourMessage {
    return Intl.message(
      'Type your message here ...',
      name: 'typeYourMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
