
import 'package:flutter/material.dart';
import 'package:social_app/Shared/cubit/cubit.dart';

class appLang
{

  // Initializations
  BuildContext context;
  late bool isEn;

  appLang(this.context)
  {
    isEn = AppCubit.get(context).lang == 'en' ? true : false;
  }


  //Get languages

  String verifyYourEmail()
  {
    return isEn ? 'Please verify your email first !' : 'برجاء التحقق من البريد الألكتروني اولاً !';
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

  String post()
  {
    return isEn ? 'Post' : 'منشور';
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








}




String langSalla(context)
{
  if(true)
  {
    return'Salla';
  }
  else
  {
    return'سلة';
  }

}

String langNewProduct(context)
{
  if(true)
  {
    return'New Product';
  }
  else
  {
    return'منتجات جديدة';
  }

}

String langHome(context)
{
  if(true)
  {
    return'Home';
  }
  else
  {
    return'الرئيسية';
  }
}

String langCategories(context)
{
  if(true)
  {
    return'Categories';
  }
  else
  {
    return'المجموعات';
  }
}


String langFavorites(context)
{
  if(true)
  {
    return'Favorites';
  }
  else
  {
    return'المُفضلة';
  }
}

String langSettings(context)
{
  if(true)
  {
    return'Settings';
  }
  else
  {
    return'الأعدادات';
  }
}

String langDarkMode(context)
{
  if(true)
  {
    return'DarkMode';
  }
  else
  {
    return'الوضع الليلي';
  }
}

String langLanguage(context)
{
  if(true)
  {
    return'Language';
  }
  else
  {
    return'اللغة';
  }
}

String langEditProfile(context)
{
  if(true)
  {
    return'Edit Profile';
  }
  else
  {
    return'تعديل بيانات الملف الشخصي';
  }
}

String langAboutDeveloper(context)
{
  if(true)
  {
    return'About Developer';
  }
  else
  {
    return'معلومات عن مطور التطبيق';
  }
}

String langLogOut(context)
{
  if(true)
  {
    return'Logout';
  }
  else
  {
    return'تسجيل الخروج';
  }
}

String langLogIn(context)
{
  if(true)
  {
    return'Login';
  }
  else
  {
    return'تسجيل الدخول';
  }
}

String langUserName(context)
{
  if(true)
  {
    return'User Name';
  }
  else
  {
    return'اسم المُستخدم';
  }
}

String langEnterYourUserName(context)
{
  if(true)
  {
    return'Please enter your user name';
  }
  else
  {
    return'برجاء ادخال اسم المستخدم';
  }
}


String langPhone(context)
{
  if(true)
  {
    return'Phone';
  }
  else
  {
    return'رقم الهاتف';
  }
}

String langEnterYourPhone(context)
{
  if(true)
  {
    return'Please enter your phone';
  }
  else
  {
    return'برجاء ادخال رقم المستخدم';
  }
}

String langEmailAddress(context)
{
  if(true)
  {
    return'Email Address';
  }
  else
  {
    return'عنوان البريد الألكتروني';
  }
}

String langEnterYourEmailAddress(context)
{
  if(true)
  {
    return'Please enter your Email Address';
  }
  else
  {
    return'برجاء ادخال عنوان البريد الألكتروني';
  }
}

String langPassword(context)
{
  if(true)
  {
    return'Password';
  }
  else
  {
    return'كلمة المرور';
  }
}

String langEnterYourPassword(context)
{
  if(true)
  {
    return'Please enter your password';
  }
  else
  {
    return'برجاء ادخال كلمة المرور';
  }
}

String langInCart(context)
{
  if(true)
  {
    return'In Cart';
  }
  else
  {
    return'السلة';
  }
}

String langTotal(context)
{
  if(true)
  {
    return'Total :';
  }
  else
  {
    return'المجموع :';
  }
}

String langRegister(context)
{
  if(true)
  {
    return'Register';
  }
  else
  {
    return'تسجيل حساب جديد';
  }
}

String langSearch(context)
{
  if(true)
  {
    return'Search';
  }
  else
  {
    return'بحث';
  }
}

String langUpdate(context)
{
  if(true)
  {
    return'Update';
  }
  else
  {
    return'تحديث البيانات';
  }
}

String langDiscount(context)
{
  if(true)
  {
    return'Discount';
  }
  else
  {
    return'خصم لفترة محدودة';
  }
}

String langConnectionError(context)
{
  if(true)
  {
    return'Connection Error';
  }
  else
  {
    return'لا يوجد اتصال بالأنترنت';
  }
}

String langConnectionErrorDescription(context)
{
  if(true)
  {
    return'Please check your internet connection !';
  }
  else
  {
    return'برجاء التأكد من اتصالك بالأنترنت و إعادة المحاولة';
  }
}

String langreTry(context)
{
  if(true)
  {
    return'RETRY';
  }
  else
  {
    return'إعادة المحاولة';
  }
}

String langAddedSuccessfully(context)
{
  if(true)
  {
    return'Added Successfully';
  }
  else
  {
    return'تم إضافة المُنتج الي السلة';
  }
}


String langPleaseWait(context)
{
  if(true)
  {
    return'Please Wait';
  }
  else
  {
    return'برجاء الأنتظار';
  }
}

String langThereIsNoItems(context)
{
  if(true)
  {
    return'There is no items in your cart !';
  }
  else
  {
    return'لا يوجد اصناف';
  }
}

String langLoginNowToBrowseOurHotOffers(context)
{
  if(true)
  {
    return'Login now to communicate with friends ';
  }
  else
  {
    return'سجل الأن للتواصل مع الأصدقاء';
  }
}

String langDontHaveAnAccount(context)
{
  if(true)
  {
    return'Don\'t have an account?';
  }
  else
  {
    return'مُستخدم جديد ؟';
  }
}

String langNoFavoritesFound(context)
{
  if(true)
  {
    return'No Fevorites Found !';
  }
  else
  {
    return'لا يوجد اصناف بالمفضلة !';
  }
}

// String langLoginError(context)
// {
//   if(true)
//   {
//     return'Login faild , Please check your email address and password';
//   }
//   else
//   {
//     return'فشل تسجيل الدخول , برجاء التأكد من البريد الألكتروني و كلمة المرور و إعادة المحاولة';
//   }
// }