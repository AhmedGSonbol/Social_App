
import 'package:flutter/material.dart';
import 'package:social_app/Shared/cubit/cubit.dart';

class AppLang
{

  // Initializations
  BuildContext context;
  late bool isEn;

  AppLang(this.context)
  {
    isEn = AppCubit.get(context).lang == 'en' ? true : false;
  }


  //Get languages

  String verifyYourEmail()
  {
    return isEn ? 'Please verify your email !' : 'برجاء تأكيد البريد الألكتروني !';
  }

  String emailVerified()
  {
    return isEn ? 'Your email has been verified successfully' : 'تم تأكيد حسابك بنجاح';
  }

  String offline()
  {
    return isEn ? 'You are offline !' : 'لا يوجد إتصال بالإنترنت !';
  }

  String retry()
  {
    return isEn ? 'Retry' : 'إعادة المحاولة';
  }

  String send()
  {
    return isEn ? 'Send' : 'إرسال';
  }

  String checkYourMail()
  {
    return isEn ? 'Check your email !' : 'تم إرسال رسالة علي بريدك الإلكتروني , برجاء التحقق';
  }

  String feedsHeader()
  {
    return isEn ? 'News Feed' : 'الصفحة الرئيسية';
  }

  String feeds()
  {
    return isEn ? 'Feed' : 'رئيسية';
  }

  String chats()
  {
    return isEn ? 'Chats' : 'محادثات';
  }

  String homePost()
  {
    return isEn ? 'Post' : 'منشور';
  }

  String addPost()
  {
    return isEn ? 'Add Post' : 'إضافة منشور';
  }

  String post()
  {
    return isEn ? 'Post' : 'نشر';
  }

  String addPostTextOrImage()
  {
    return isEn ? 'Please add text or image to your post before making a post !' : 'برجاء إضافة نص او صورة قبل إنشاء المنشور !';
  }

  String publishPost()
  {
    return isEn ? 'Post was published successfully !' : 'تم نشر المنشور بنجاح !';
  }

  String editPost()
  {
    return isEn ? 'Post updated successfully !' : 'تم تعديل المنشور بنجاح !';
  }

  String publicPost()
  {
    return isEn ? 'Public' : 'عام';
  }

   String noPosts()
  {
    return isEn ? 'No Posts !' : 'لا يوجد منشورات !';
  }

  String whatIsInYourMind()
  {
    return isEn ? 'What is in your mind' : 'ما الذي تفكر في نشرة';
  }

  String users()
  {
    return isEn ? 'Users' : 'مستخدمين';
  }

  String profile()
  {
    return isEn ? 'Profile' : 'صفحتي';
  }

  String profileHeader()
  {
    return isEn ? 'My Profile' : 'صفحتي الشخصية';
  }

  String communicate()
  {
    return isEn ? 'Communicate With Friends' : 'تواصل مع اصدقائك';
  }

  String comments()
  {
    return isEn ? 'comments' : 'تعليقات';
  }

  String noComments()
  {
    return isEn ? 'No comments !' : 'لا يوجد تعليقات !';
  }

  String like()
  {
    return isEn ? 'Like' : 'إعجاب';
  }

  String liked()
  {
    return isEn ? 'liked' : 'اعجبني';
  }

  String writeAComment()
  {
    return isEn ? 'Write a comment ...' : 'اكتب تعليقاً ...';
  }

  String posts()
  {
    return isEn ? 'Posts' : 'المنشورات';
  }

  String photos()
  {
    return isEn ? 'Photos' : 'الصور';
  }

  String followers()
  {
    return isEn ? 'Followers' : 'المتابعين';
  }

  String following()
  {
    return isEn ? 'Following' : 'أتابعهم';
  }

  String noMessagesYet()
  {
    return isEn ? 'No Messages Yet .' : 'لا يوجد رسائل بعد .';
  }

  String search()
  {
    return isEn ? 'Search' : 'البحث';
  }

  String searchResultWillBeShownHere()
  {
    return isEn ? 'Search results will be shown here !' : 'سوف تظهر نتائج البحث هنا !';
  }

  String editProfile()
  {
    return isEn ? 'Edit Profile' : 'تحديث البيانات';
  }

  String update()
  {
    return isEn ? 'Update' : 'تحديث';
  }

  String checkYourDataFirstBeforeUpdate()
  {
    return isEn ? 'Please change your data first to update !' : 'لا يوجد تعديل في بياناتك !';
  }

  String updateData()
  {
    return isEn ? 'Data has been updated successfully' : 'تم تعديل البيانات بنجاح';
  }


  String settings()
  {
    return isEn ? 'Name' : 'الإعدادات';
  }

  String darkmode()
  {
    return isEn ? 'Dark Mode' : 'الوضع الليلي';
  }

  String language()
  {
    return isEn ? 'Language' : 'اللغة';
  }

  String aboutDeveloper()
  {
    return isEn ? 'About Developer' : 'عن المُطور';
  }

  String logout()
  {
    return isEn ? 'Logout' : 'تسجيل الخروج';
  }

  String incorrectEmailOrPass()
  {
    return isEn ? 'Your email or password is incorrect!' : 'بريدك الإلكتروني او كلمة المرور ليست صحيحة !';
  }

  String tryAgainLater()
  {
    return isEn ? 'Please try again later !' : 'الرجاء معاودة المحاولة في وقت لاحق !';
  }

  String login()
  {
    return isEn ? 'Login' : 'تسجيل الدخول';
  }

  // String loginDesc()
  // {
  //   return isEn ? 'Login now to communicate with friends ' : 'الأسم';
  // }

  String emailAddress()
  {
    return isEn ? 'Email Address' : 'البريد الألكتروني';
  }

  String checkEmailAddressField()
  {
    return isEn ? 'Enter Email' : 'برجاء إدخال البريد الألكتروني';
  }

  String password()
  {
    return isEn ? 'Password' : 'كلمة المرور';
  }

  String checkPasswordField()
  {
    return isEn ? 'Enter password' : 'برجاء إدخال كلمة المرور';
  }

  String donotHaveAnAcc()
  {
    return isEn ? 'Don\'t have an account ?' : 'لا يوجد لديك حساب ؟';
  }

  String register()
  {
    return isEn ? 'Register' : 'سجل الآن';
  }






  String userName()
  {
    return isEn ? 'User Name' : 'اسم المُستخدم';
  }

  String checkUserName()
  {
    return isEn ? 'User Name must not be empty !' : 'برجاء إدخال اسم المُستخدم !';
  }

  String bio()
  {
    return isEn ? 'Bio' : 'السيرة الذاتية';
  }

  String checkBio()
  {
    return isEn ? 'Bio must not be empty !' : 'برجاء إدخال السيرة الذاتية !';
  }

  String phone()
  {
    return isEn ? 'Phone' : 'الهاتف';
  }

  String checkPhone()
  {
    return isEn ? 'Phone must not be empty !' : 'برجاء إدخال الهاتف !';
  }

  String registeredSuccessfully()
  {
    return isEn ? 'You have been registered successfully !' : 'لقد تم تسجيلك بنجاح!';
  }

  String emailAddressIsNotValid()
  {
    return isEn ? 'Your email address is not valid !' : 'عنوان بريدك الإلكتروني غير صالح!';
  }

  String emailAlreadyInUse()
  {
    return isEn ? 'The email address is already in use by another account !' : 'عنوان البريد الإلكتروني قيد الاستخدام بالفعل من قبل حساب آخر!';
  }

  String phoneNumber11()
  {
    return isEn ? 'Your phone number must be at least 11 number!' : 'رقم هاتفك يجب أن لا يقل عن 11 رقم!';
  }

  String incorrectEmailFormat()
  {
    return isEn ? 'Your email address is not in a correct format !' : 'عنوان بريدك الإلكتروني الذي ادخلته غير صالح !';
  }

  String password6char()
  {
    return isEn ? 'Your password should be at least 6 characters !' : 'يجب أن تتكون كلمة المرور الخاصة بك من 6 أحرف على الأقل!';
  }

  String editPostTitle()
  {
    return isEn ? 'Edit Post' : 'تعديل المنشور';
  }

  String edit()
  {
    return isEn ? 'Edit' : 'تعديل';
  }

  String delete()
  {
    return isEn ? 'Delete' : 'حذف';
  }

  String addPhoto()
  {
    return isEn ? 'Add Photo' : 'إضافة صورة';
  }

  String deleteCommentHeader()
  {
    return isEn ? 'Delete comment !' : 'حذف التعليق !';
  }

  String deleteCommentDesc()
  {
    return isEn ? 'Are you sure , you want to delete your comment ?' : 'هل انت متأكد من حذف تعليقك ؟';
  }

  String deletePostHeader()
  {
    return isEn ? 'Delete post !' : 'حذف المنشور !';
  }

  String deletePostDesc()
  {
    return isEn ? 'Are you sure , you want to delete your post ?' : 'هل انت متأكد من حذف منشورك ؟';
  }

  String ok()
  {
    return isEn ? 'Ok' : 'نعم';
  }

  String cancel()
  {
    return isEn ? 'Cancel' : 'لا';
  }


  String postComments()
  {
    return isEn ? 'Post Comments' : 'تعليقات المنشور';
  }

  String deletePostSuccess()
  {
    return isEn ? 'The post has been successfully deleted !' : 'تم حذف المنشور بنجاح !';
  }









}
