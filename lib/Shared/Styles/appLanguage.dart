
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
    return isEn ? 'Profile' : 'بروفايل';
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









}




// String langSalla(context)
// {
//   if(true)
//   {
//     return'Salla';
//   }
//   else
//   {
//     return'سلة';
//   }
//
// }
//
// String langNewProduct(context)
// {
//   if(true)
//   {
//     return'New Product';
//   }
//   else
//   {
//     return'منتجات جديدة';
//   }
//
// }
//
// String langHome(context)
// {
//   if(true)
//   {
//     return'Home';
//   }
//   else
//   {
//     return'الرئيسية';
//   }
// }
//
// String langCategories(context)
// {
//   if(true)
//   {
//     return'Categories';
//   }
//   else
//   {
//     return'المجموعات';
//   }
// }
//
//
// String langFavorites(context)
// {
//   if(true)
//   {
//     return'Favorites';
//   }
//   else
//   {
//     return'المُفضلة';
//   }
// }
//
// String langSettings(context)
// {
//   if(true)
//   {
//     return'Settings';
//   }
//   else
//   {
//     return'الأعدادات';
//   }
// }
//
// String langDarkMode(context)
// {
//   if(true)
//   {
//     return'DarkMode';
//   }
//   else
//   {
//     return'الوضع الليلي';
//   }
// }
//
// String langLanguage(context)
// {
//   if(true)
//   {
//     return'Language';
//   }
//   else
//   {
//     return'اللغة';
//   }
// }
//
// String langEditProfile(context)
// {
//   if(true)
//   {
//     return'Edit Profile';
//   }
//   else
//   {
//     return'تعديل بيانات الملف الشخصي';
//   }
// }
//
// String langAboutDeveloper(context)
// {
//   if(true)
//   {
//     return'About Developer';
//   }
//   else
//   {
//     return'معلومات عن مطور التطبيق';
//   }
// }
//
// String langLogOut(context)
// {
//   if(true)
//   {
//     return'Logout';
//   }
//   else
//   {
//     return'تسجيل الخروج';
//   }
// }
//
// String langLogIn(context)
// {
//   if(true)
//   {
//     return'Login';
//   }
//   else
//   {
//     return'تسجيل الدخول';
//   }
// }
//
// String langUserName(context)
// {
//   if(true)
//   {
//     return'User Name';
//   }
//   else
//   {
//     return'اسم المُستخدم';
//   }
// }
//
// String langEnterYourUserName(context)
// {
//   if(true)
//   {
//     return'Please enter your user name';
//   }
//   else
//   {
//     return'برجاء ادخال اسم المستخدم';
//   }
// }
//
//
// String langPhone(context)
// {
//   if(true)
//   {
//     return'Phone';
//   }
//   else
//   {
//     return'رقم الهاتف';
//   }
// }
//
// String langEnterYourPhone(context)
// {
//   if(true)
//   {
//     return'Please enter your phone';
//   }
//   else
//   {
//     return'برجاء ادخال رقم المستخدم';
//   }
// }
//
// String langEmailAddress(context)
// {
//   if(true)
//   {
//     return'Email Address';
//   }
//   else
//   {
//     return'عنوان البريد الألكتروني';
//   }
// }
//
// String langEnterYourEmailAddress(context)
// {
//   if(true)
//   {
//     return'Please enter your Email Address';
//   }
//   else
//   {
//     return'برجاء ادخال عنوان البريد الألكتروني';
//   }
// }
//
// String langPassword(context)
// {
//   if(true)
//   {
//     return'Password';
//   }
//   else
//   {
//     return'كلمة المرور';
//   }
// }
//
// String langEnterYourPassword(context)
// {
//   if(true)
//   {
//     return'Please enter your password';
//   }
//   else
//   {
//     return'برجاء ادخال كلمة المرور';
//   }
// }
//
// String langInCart(context)
// {
//   if(true)
//   {
//     return'In Cart';
//   }
//   else
//   {
//     return'السلة';
//   }
// }
//
// String langTotal(context)
// {
//   if(true)
//   {
//     return'Total :';
//   }
//   else
//   {
//     return'المجموع :';
//   }
// }
//
// String langRegister(context)
// {
//   if(true)
//   {
//     return'Register';
//   }
//   else
//   {
//     return'تسجيل حساب جديد';
//   }
// }
//
// String langSearch(context)
// {
//   if(true)
//   {
//     return'Search';
//   }
//   else
//   {
//     return'بحث';
//   }
// }
//
// String langUpdate(context)
// {
//   if(true)
//   {
//     return'Update';
//   }
//   else
//   {
//     return'تحديث البيانات';
//   }
// }
//
// String langDiscount(context)
// {
//   if(true)
//   {
//     return'Discount';
//   }
//   else
//   {
//     return'خصم لفترة محدودة';
//   }
// }
//
// String langConnectionError(context)
// {
//   if(true)
//   {
//     return'Connection Error';
//   }
//   else
//   {
//     return'لا يوجد اتصال بالأنترنت';
//   }
// }
//
// String langConnectionErrorDescription(context)
// {
//   if(true)
//   {
//     return'Please check your internet connection !';
//   }
//   else
//   {
//     return'برجاء التأكد من اتصالك بالأنترنت و إعادة المحاولة';
//   }
// }
//
// String langreTry(context)
// {
//   if(true)
//   {
//     return'RETRY';
//   }
//   else
//   {
//     return'إعادة المحاولة';
//   }
// }
//
// String langAddedSuccessfully(context)
// {
//   if(true)
//   {
//     return'Added Successfully';
//   }
//   else
//   {
//     return'تم إضافة المُنتج الي السلة';
//   }
// }
//
//
// String langPleaseWait(context)
// {
//   if(true)
//   {
//     return'Please Wait';
//   }
//   else
//   {
//     return'برجاء الأنتظار';
//   }
// }
//
// String langThereIsNoItems(context)
// {
//   if(true)
//   {
//     return'There is no items in your cart !';
//   }
//   else
//   {
//     return'لا يوجد اصناف';
//   }
// }
//
// String langLoginNowToBrowseOurHotOffers(context)
// {
//   if(true)
//   {
//     return'Login now to communicate with friends ';
//   }
//   else
//   {
//     return'سجل الأن للتواصل مع الأصدقاء';
//   }
// }
//
// String langDontHaveAnAccount(context)
// {
//   if(true)
//   {
//     return'Don\'t have an account?';
//   }
//   else
//   {
//     return'مُستخدم جديد ؟';
//   }
// }
//
// String langNoFavoritesFound(context)
// {
//   if(true)
//   {
//     return'No Fevorites Found !';
//   }
//   else
//   {
//     return'لا يوجد اصناف بالمفضلة !';
//   }
// }
//
// // String langLoginError(context)
// // {
// //   if(true)
// //   {
// //     return'Login faild , Please check your email address and password';
// //   }
// //   else
// //   {
// //     return'فشل تسجيل الدخول , برجاء التأكد من البريد الألكتروني و كلمة المرور و إعادة المحاولة';
// //   }
// // }